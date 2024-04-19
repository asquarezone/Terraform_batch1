#!/bin/bash
echo "Creating VPC"
vpc_id=$(aws ec2 create-vpc \
    --cidr-block 10.0.0.0/16 \
    --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=from-cli}]' \
    --region "us-west-2" \
    --query "Vpc.VpcId" \
    --output text)
echo "Created VPC with ID: $vpc_id"

web1_id=$(aws ec2 create-subnet \
    --vpc-id "$vpc_id" \
    --cidr-block 10.0.1.0/24 \
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=web-1}]' \
    --availability-zone "us-west-2a" \
    --region "us-west-2" \
    --query "Subnet.SubnetId" \
    --output text)

echo "Created Subnet with ID: $web1_id"

web2_id=$(aws ec2 create-subnet \
    --vpc-id "$vpc_id" \
    --cidr-block 10.0.2.0/24 \
    --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=web-2}]' \
    --availability-zone "us-west-2b" \
    --region "us-west-2" \
    --query "Subnet.SubnetId" \
    --output text)

echo "Created Subnet with ID: $web2_id"
