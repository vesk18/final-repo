terraform {
  backend "s3" {
    bucket         = "vesk18-final"
    key            = "eks/terraform.tfstate" 
    region         = "eu-central-1"
    encrypt        = true
   #  dynamodb_table = "terraform-lock-table"   
  }
}
