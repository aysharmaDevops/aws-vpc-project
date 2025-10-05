#!/bin/bash
# 01_create_vpc.sh
# Creates a VPC and shows the new VPC ID (masked placeholder will be used in repo)
set -euo pipefail
echo "Creating VPC (10.0.0.0/16)..."
aws ec2 create-vpc --cidr-block 10.0.0.0/16 --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=Ayush-VPC}]' --query 'Vpc.VpcId' --output text
echo "If the command above printed a VPC ID like vpc-xxxxxxxxxxxx, save that ID and replace placeholders in subsequent scripts."
