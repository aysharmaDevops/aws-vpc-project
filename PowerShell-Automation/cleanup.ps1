<#
    Title: AWS Resource Cleanup Script
    Author: Ayush Sharma
    Purpose: Safe teardown of chargeable AWS components (Elastic IPs, NATs, EC2)
    Region: us-east-1
#>

$ErrorActionPreference = "Stop"
$Region = "us-east-1"

# Find VPC by Tag
$VpcId = (aws ec2 describe-vpcs --filters "Name=tag:Name,Values=Ayush-VPC" --query "Vpcs[0].VpcId" --output text --region $Region)

if (!$VpcId) {
    Write-Host "No VPC with tag 'Ayush-VPC' found in $Region. Exiting."
    exit 0
}

Write-Host "Cleaning resources for VPC: $VpcId" -ForegroundColor Cyan

# Delete NAT Gateways in this VPC
$NatIds = aws ec2 describe-nat-gateways --filter "Name=vpc-id,Values=$VpcId" --query "NatGateways[].NatGatewayId" --output text --region $Region
if ($NatIds) {
    foreach ($n in $NatIds.Split()) {
        Write-Host "Deleting NAT: $n"
        aws ec2 delete-nat-gateway --nat-gateway-id $n --region $Region | Out-Null
    }
    Start-Sleep -Seconds 60
}

# Release unassociated EIPs in the account (careful - global)
$Eips = aws ec2 describe-addresses --query "Addresses[?AssociationId==null].AllocationId" --output text --region $Region
if ($Eips) {
    foreach ($e in $Eips.Split()) {
        Write-Host "Releasing EIP: $e"
        aws ec2 release-address --allocation-id $e --region $Region | Out-Null
    }
}

# Terminate EC2 instances in the VPC
$Instances = aws ec2 describe-instances --filters "Name=vpc-id,Values=$VpcId" --query "Reservations[].Instances[].InstanceId" --output text --region $Region
if ($Instances) {
    Write-Host "Terminating Instances: $Instances"
    aws ec2 terminate-instances --instance-ids $Instances --region $Region | Out-Null
    Start-Sleep -Seconds 20
}

Write-Host "Cleanup script finished. Verify console for resources that take longer to delete (NATs, ENIs)." -ForegroundColor Green