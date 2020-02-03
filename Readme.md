# AWS Skeleton

This repo provide a standard AWS Network architecture with public and private zone

## Variables

You need to provide a terraform.tfvars with at least your `keypair_name`


## Remote TFState

The TFstate will be stored in S3 bucket (by default on eu-west-1 as `aws-skeleton-eu-west-1/terraform-network.tfstate`). You have to adapt it according your needs in *main.tfù

## Tags

Each ressources will be tags with a "env / region" label.
