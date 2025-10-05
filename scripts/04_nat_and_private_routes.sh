#!/bin/bash
# 04_nat_and_private_routes.sh
# Allocate an Elastic IP, create NAT Gateway in the public subnet, then create private route table to NAT
set -euo pipefail
VPC_ID="${1:-vpc-xxxxxxxxxxxx}"
PUBLIC_SUBNET="${2:-subnet-xxxxxxxxxxxx}"
PRIVATE_SUBNET="${3:-subnet-xxxxxxxxxxxx}"
echo "Allocating Elastic IP..."
ALLOC=$(aws ec2 allocate-address --domain vpc --tag-specifications 'ResourceType=elastic-ip,Tags=[{Key=Name,Value=Ayush-NAT-EIP}]' --query 'AllocationId' --output text)
echo "AllocationId=${ALLOC}"
echo "Creating NAT Gateway in ${PUBLIC_SUBNET}"
NAT_ID=$(aws ec2 create-nat-gateway --subnet-id ${PUBLIC_SUBNET} --allocation-id ${ALLOC} --tag-specifications 'ResourceType=natgateway,Tags=[{Key=Name,Value=Ayush-NAT-GW}]' --query 'NatGateway.NatGatewayId' --output text)
echo "NAT creation started: ${NAT_ID} (wait ~1-2 mins until State=available)"
echo "Create private route table and add 0.0.0.0/0 -> NAT"
PRTB=$(aws ec2 create-route-table --vpc-id ${VPC_ID} --tag-specifications 'ResourceType=route-table,Tags=[{Key=Name,Value=Ayush-Private-RT}]' --query 'RouteTable.RouteTableId' --output text)
aws ec2 create-route --route-table-id ${PRTB} --destination-cidr-block 0.0.0.0/0 --nat-gateway-id ${NAT_ID}
aws ec2 associate-route-table --route-table-id ${PRTB} --subnet-id ${PRIVATE_SUBNET}
echo "Private RT ${PRTB} associated with ${PRIVATE_SUBNET} -> routes via ${NAT_ID}"
