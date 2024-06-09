Q1:
PS: If you do not have access to an AWS account, you can use localstack to simulate AWS API’s.
We would like to deploy two ec2 instances into two different aws regions use the same terraform code. Write the terraform code that fulfil the bellow requirements.
Regions: us-east-1, us-east-2
Instance type= t2.small

We expect you to create all the required infrastructure (VPC, subnets, …) via terraform. You are allowed to use modules.

Ans-
To solve this problem statement I have used alias attributes to differentiate aws regions us-east-1, and us-east-2 by using same Terraform code.I have deployed the Infrastructure as per the requirement given in problem statement. 

Q2:
We have the following provider code snippet:
provider "aws" {
  region = "eu-west-1"
}
provider "aws" {
  region = "eu-central-1"
}
provider "aws" {
  region = "eu-east-1"
}
When we try to run terraform, we see an error saying:
Duplicate ‘provider’ configuration.
How can we fix this? How can we use it in our code? Please give examples.

Ans-
You are facing this issue due to same provider using multiple times in a single code, To resolve this issue you need to use alias attribute to differentiate providers as I used in first problem statement to differentiate aws regions, Here we should use for differentiate providers from the following example we can define providers with aliases and you can use this aliases in our modules or resources.

Example:
provider "aws" {
alias  = "eu_west_1"
region = "eu-west-1"
}
provider "aws" {
alias  = "eu_central_1"
region = "eu-central-1"
}
provider "aws" {
alias  = "eu_east_1"
region = "eu-east-1"
}

