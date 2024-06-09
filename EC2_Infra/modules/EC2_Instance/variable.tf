variable "region" {
  description = "AWS region"
  type        = string
}
variable "public_subnet_id" {
  description = "Public Subnet ID"
  type        = string
}
variable "private_subnet_id" {
  description = "Private Subnet ID"
  type        = string
}
variable "security_group_id" {
  description = "Security Group ID"
  type        = string
}
variable "ami" {
  description = "AMI ID"
  type        = string
}
