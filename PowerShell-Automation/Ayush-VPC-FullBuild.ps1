<#
  Author: Ayush Sharma
  Script: Ayush-VPC-FullBuild.ps1
  Purpose: Fully automated Multi-AZ AWS VPC setup
           (1 Public + 2 Private Subnets, IGW, NAT, RTs, SGs, NACLs)
  Region: us-east-1
#>

$ErrorActionPreference = "Stop"
$Region = "us-east-1"
$TagPrefix = "Ayush"

Write-Host "🚀 Starting Multi-AZ VPC creation in $Region ..." -ForegroundColor Cyan

# 1️⃣ Create VPC
Write-Host "Creating VPC..."
$VpcId = aws ec2 create-vpc --cidr-block 10.0.0.0/16 --region $Region `
          --tag-specifications "ResourceType=vpc,Tags=[{Key=Name,Value=$TagPrefix-VPC}]" `
          --query "Vpc.VpcId" --output text
aws ec2 modify-vpc-attribute --vpc-id $VpcId --enable-dns-support
aws ec2 modify-vpc-attribute --vpc-id $VpcId --enable-dns-hostnames
Write-Host "✅ VPC Created: $VpcId"

# 2️⃣ Subnets
Write-Host "Creating Subnets..."
$PublicSubnet = aws ec2 create-subnet --vpc-id $VpcId --cidr-block 10.0.1.0/24 --availability-zone ${Region}a `
                --region $Region --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=$TagPrefix-Public}]" `
                --query "Subnet.SubnetId" --output text
$PrivateSubnet1 = aws ec2 create-subnet --vpc-id $VpcId --cidr-block 10.0.2.0/24 --availability-zone ${Region}b `
                --region $Region --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=$TagPrefix-Private-AZ1}]" `
                --query "Subnet.SubnetId" --output text
$PrivateSubnet2 = aws ec2 create-subnet --vpc-id $VpcId --cidr-block 10.0.3.0/24 --availability-zone ${Region}c `
                --region $Region --tag-specifications "ResourceType=subnet,Tags=[{Key=Name,Value=$TagPrefix-Private-AZ2}]" `
                --query "Subnet.SubnetId" --output text
aws ec2 modify-subnet-attribute --subnet-id $PublicSubnet --map-public-ip-on-launch
Write-Host "✅ Subnets Created: $PublicSubnet, $PrivateSubnet1, $PrivateSubnet2"

# 3️⃣ Internet Gateway
Write-Host "Creating Internet Gateway..."
$IGW = aws ec2 create-internet-gateway --region $Region `
        --tag-specifications "ResourceType=internet-gateway,Tags=[{Key=Name,Value=$TagPrefix-IGW}]" `
        --query "InternetGateway.InternetGatewayId" --output text
aws ec2 attach-internet-gateway --internet-gateway-id $IGW --vpc-id $VpcId
Write-Host "✅ IGW Attached: $IGW"

# 4️⃣ Public Route Table
Write-Host "Creating Public Route Table..."
$PubRT = aws ec2 create-route-table --vpc-id $VpcId --region $Region `
         --tag-specifications "ResourceType=route-table,Tags=[{Key=Name,Value=$TagPrefix-Public-RT}]" `
         --query "RouteTable.RouteTableId" --output text
aws ec2 create-route --route-table-id $PubRT --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW
aws ec2 associate-route-table --subnet-id $PublicSubnet --route-table-id $PubRT
Write-Host "✅ Public Route Table Created: $PubRT"

# 5️⃣ NAT Gateway
Write-Host "Allocating EIP and Creating NAT..."
$EIP = aws ec2 allocate-address --domain vpc --region $Region --query "AllocationId" --output text
$NatGW = aws ec2 create-nat-gateway --subnet-id $PublicSubnet --allocation-id $EIP --region $Region `
          --tag-specifications "ResourceType=natgateway,Tags=[{Key=Name,Value=$TagPrefix-NAT}]" `
          --query "NatGateway.NatGatewayId" --output text
aws ec2 wait nat-gateway-available --nat-gateway-ids $NatGW
Write-Host "✅ NAT Gateway Ready: $NatGW"

# 6️⃣ Private Route Table
Write-Host "Creating Private Route Table..."
$PrivRT = aws ec2 create-route-table --vpc-id $VpcId --region $Region `
          --tag-specifications "ResourceType=route-table,Tags=[{Key=Name,Value=$TagPrefix-Private-RT}]" `
          --query "RouteTable.RouteTableId" --output text
aws ec2 create-route --route-table-id $PrivRT --destination-cidr-block 0.0.0.0/0 --nat-gateway-id $NatGW
aws ec2 associate-route-table --subnet-id $PrivateSubnet1 --route-table-id $PrivRT
aws ec2 associate-route-table --subnet-id $PrivateSubnet2 --route-table-id $PrivRT
Write-Host "✅ Private RT Created: $PrivRT"

# 7️⃣ Security Groups
Write-Host "Creating Security Groups..."
$PublicSG = aws ec2 create-security-group --group-name "$TagPrefix-Public-SG" --description "Public Access" --vpc-id $VpcId --region $Region --output text
$PrivateSG = aws ec2 create-security-group --group-name "$TagPrefix-Private-SG" --description "Private Access" --vpc-id $VpcId --region $Region --output text

# Public SG: Allow HTTP, SSH, HTTPS
aws ec2 authorize-security-group-ingress --group-id $PublicSG --protocol tcp --port 22 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id $PublicSG --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id $PublicSG --protocol tcp --port 443 --cidr 0.0.0.0/0

# Private SG: Allow internal traffic from Public SG
aws ec2 authorize-security-group-ingress --group-id $PrivateSG --protocol -1 --source-group $PublicSG
Write-Host "✅ Security Groups Created: $PublicSG, $PrivateSG"

# 8️⃣ Network ACLs
Write-Host "Creating NACLs..."
$PublicNACL = aws ec2 create-network-acl --vpc-id $VpcId --region $Region --query "NetworkAcl.NetworkAclId" --output text
$PrivateNACL = aws ec2 create-network-acl --vpc-id $VpcId --region $Region --query "NetworkAcl.NetworkAclId" --output text

# Public NACL: allow all in/out (demo setup)
aws ec2 create-network-acl-entry --network-acl-id $PublicNACL --rule-number 100 --protocol -1 --rule-action allow --egress false --cidr-block 0.0.0.0/0
aws ec2 create-network-acl-entry --network-acl-id $PublicNACL --rule-number 110 --protocol -1 --rule-action allow --egress true --cidr-block 0.0.0.0/0

# Private NACL: only allow internal + NAT
aws ec2 create-network-acl-entry --network-acl-id $PrivateNACL --rule-number 100 --protocol -1 --rule-action allow --egress false --cidr-block 10.0.0.0/16
aws ec2 create-network-acl-entry --network-acl-id $PrivateNACL --rule-number 110 --protocol -1 --rule-action allow --egress true --cidr-block 0.0.0.0/0

aws ec2 associate-network-acl --subnet-id $PublicSubnet --network-acl-id $PublicNACL
aws ec2 associate-network-acl --subnet-id $PrivateSubnet1 --network-acl-id $PrivateNACL
aws ec2 associate-network-acl --subnet-id $PrivateSubnet2 --network-acl-id $PrivateNACL
Write-Host "✅ NACLs Created and Associated"

# ✅ Final Output
Write-Host "`n🎯 SETUP COMPLETE!" -ForegroundColor Green
Write-Host "VPC: $VpcId"
Write-Host "Public Subnet: $PublicSubnet"
Write-Host "Private Subnets: $PrivateSubnet1, $PrivateSubnet2"
Write-Host "IGW: $IGW"
Write-Host "NAT: $NatGW"
Write-Host "Public SG: $PublicSG"
Write-Host "Private SG: $PrivateSG"
Write-Host "Public NACL: $PublicNACL"
Write-Host "Private NACL: $PrivateNACL"