#!/bin/bash
# 02_create_subnets.sh
# Create public and private subnets (update AZ if you need a specific one)
set -euo pipefail
VPC_ID="${1:-vpc-xxxxxxxxxxxx}"   # replace or pass as first arg
echo "Using VPC_ID=${VPC_ID}"
echo "Creating public subnet (10.0.1.0/24) in us-east-1a ..."
aws ec2 create-subnet --vpc-id ${VPC_ID} --cidr-block 10.0.1.0/24 --availability-zone us-east-1a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=Ayush-Public-Subnet}]' --query 'Subnet.SubnetId' --output text
echo "Creating private subnet (10.0.2.0/24) in us-east-1a ..."
aws ec2 create-subnet --vpc-id ${VPC_ID} --cidr-block 10.0.2.0/24 --availability-zone us-east-1a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=Ayush-Private-Subnet}]' --query 'Subnet.SubnetId' --output text
echo "Note: record the returned subnet IDs and use them in later scripts."
