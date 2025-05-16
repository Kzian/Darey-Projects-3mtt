#!/bin/bash

# ======= CONFIGURATION ========
BUCKET_NAME="my-bucket-demo-13579"  # change to a unique name
EC2_NAME_TAG="InstanceDemo"
AMI_ID="ami-084568db4383264d4"  # ubuntu AMI (for us-east-1)
INSTANCE_TYPE="t2.micro"
KEY_NAME="linuxkey"  # Replace with your existing key pair name
SECURITY_GROUP="launch-wizard-1"  # Replace with your security group name
# ==============================

# -------- Function to check AWS CLI --------
check_aws_cli() {
    if ! command -v aws &> /dev/null; then
        echo "❌ AWS CLI is not installed. Please install it before proceeding."
        exit 1
    else
        echo "✅ AWS CLI is installed."
    fi
}

# -------- Function to check AWS profile --------
check_aws_profile() {
    if [ -z "$AWS_PROFILE" ]; then
        echo "❌ AWS profile environment variable is not set."
        exit 1
    else
        echo "✅ AWS profile is set to '$AWS_PROFILE'."
    fi
}


# -------- Function to check and create S3 bucket --------
create_s3_bucket() {
    echo "🔍 Checking if S3 bucket '$BUCKET_NAME' exists..."

    if aws s3api head-bucket --bucket "$BUCKET_NAME" &>/dev/null; then
        echo "📦 S3 bucket '$BUCKET_NAME' already exists."
    else
        echo "📦 Creating S3 bucket '$BUCKET_NAME'..."
        aws s3api create-bucket \
            --bucket "$BUCKET_NAME" \
            --endpoint-url https://s3.amazonaws.com
        if [ $? -eq 0 ]; then
            echo "✅ Bucket '$BUCKET_NAME' created successfully."
        else
            echo "❌ Failed to create bucket."
        fi
    fi
}

# -------- Function to launch EC2 instance --------
launch_ec2_instance() {
    echo "🔍 Checking for existing EC2 instance with name '$EC2_NAME_TAG'..."

    instance_id=$(aws ec2 describe-instances \
        --filters "Name=tag:Name,Values=$EC2_NAME_TAG" "Name=instance-state-name,Values=running" \
        --query "Reservations[].Instances[].InstanceId" --output text)

    if [ -n "$instance_id" ]; then
        echo "💻 EC2 instance '$EC2_NAME_TAG' is already running (Instance ID: $instance_id)."
    else
        echo "💻 Launching new EC2 instance..."
        aws ec2 run-instances \
            --image-id "$AMI_ID" \
            --instance-type "$INSTANCE_TYPE" \
            --key-name "$KEY_NAME" \
            --security-groups "$SECURITY_GROUP" \
            --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$EC2_NAME_TAG}]" \
            --region "$AWS_REGION"

        if [ $? -eq 0 ]; then
            echo "✅ EC2 instance '$EC2_NAME_TAG' launched successfully."
        else
            echo "❌ Failed to launch EC2 instance."
        fi
    fi
}

# -------- MAIN SCRIPT --------
check_aws_cli
check_aws_profile

# Ensure AWS_REGION is set
if [ -z "$AWS_REGION" ]; then
    echo "❌ AWS_REGION environment variable is not set. Set it like: export AWS_REGION=us-east-1"
    exit 1
fi

create_s3_bucket
launch_ec2_instance


