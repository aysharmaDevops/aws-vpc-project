#!/bin/bash
# 03_create_igw_and_routes.sh
# Create Internet Gateway, attach to VPC, create public route table and associate with public subnet
set -euo pipefail
VPC_ID="${1:-vpc-xxxxxxxxxxxx}"
PUBLIC_SUBNET="${2:-subnet-xxxxxxxxxxxx}"
echo "Creating Internet Gateway..."
IGW_ID=$(aws ec2 create-internet-gateway --tag-specifications 'ResourceType=internet-gateway,Tags=[{Key=Name,Value=Ayush-IGW}]' --query 'InternetGateway.InternetGatewayId' --output text)
echo "IGW_ID=${IGW_ID}"
echo "Attaching IGW to ${VPC_ID}"
aws ec2 attach-internet-gateway --internet-gateway-id ${IGW_ID} --vpc-id ${VPC_ID}
echo "Creating public route table and adding 0.0.0.0/0 → IGW"
RTB_ID=$(aws ec2 create-route-table --vpc-id ${VPC_ID} --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=Ayush-Public-RT}]' --query 'RouteTable.RouteTableId' --output text)
aws ec2 create-route --route-table-id ${RTB_ID} --destination-cidr-block 0.0.0.0/0 --gateway-id ${IGW_ID}
aws ec2 associate-route-table --route-table-id ${RTB_ID} --subnet-id ${PUBLIC_SUBNET}
echo "Public RTB ${RTB_ID} associated with ${PUBLIC_SUBNET}. Ensure MapPublicIpOnLaunch is enabled for that subnet."
