terraform {
  backend "s3" {
    bucket         = "vasimbucketteststatefile"       # Your S3 bucket
<<<<<<< HEAD
    key            = "day-6/terraform.tfstate"        # Path inside the bucket
    region         = "us-east-1" 
    #use_lockfile = true                    # Your AWS region
=======
    key            = "day-4/terraform.tfstate"        # Path inside the bucket
    region         = "us-east-1"   
    use_lockfile = true                   # Your AWS region
>>>>>>> 392829e (Commit before rebase)
    #dynamodb_table = "terraform-lock-table"           # For state locking
    #encrypt        = true                              # Encrypt the state file
  }
}
