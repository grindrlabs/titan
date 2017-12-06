# TITAN Network Module

# Data provider of current AWS region
data "aws_region" "current" { current = true }

# Data provider of current AWS account id, user id, and ARN
data "aws_caller_identity" "current" {}
