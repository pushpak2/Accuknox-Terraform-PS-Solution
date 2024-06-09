resource "aws_key_pair" "main" {
  key_name   = "main-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "public_instance" {
  ami                    = var.ami
  instance_type          = "t2.small"
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids     = [var.security_group_id]
  key_name               = aws_key_pair.main.key_name

  tags = {
    Name = "Accuknox-EC2"
  }
}
