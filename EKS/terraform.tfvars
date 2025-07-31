# AWS account config
region = "eu-central-1"

# General for all infrastructure
# This is the name prefix for all infra components
name = "danit"


#vpc_id      = "vpc-06ae62935ffb33e2b"
#subnets_ids = ["subnet-0b27929ad2896d99f", "subnet-0c15a8c6856de7853", "subnet-01a5c422124b1c69e"]


#vpc_id      = "vpc-0b3c6a5edabcbc866"
#subnets_ids = ["subnet-09147e169de2bbedd", "subnet-014fb3015844ed798", "subnet-09e5991259d455b0f"]

vpc_id       = "vpc-06df0f1ed4e799adb"
subnets_ids  = ["subnet-0f77887c9e69fc162", "subnet-07bea859869364a5e", "subnet-0c31f62635097ce22"]


tags = {
  Environment = "test-studen1"
  TfControl   = "true"
}

zone_name = "devops7.test-danit.com"

