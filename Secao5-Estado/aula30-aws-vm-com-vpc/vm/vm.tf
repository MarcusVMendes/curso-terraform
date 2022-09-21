resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true

  tags = {
    Name = "vm-terraform"
  }
}

/*
Para o subnet_id foi realizado primeiro um output no subnet_id(arquivo output da vpc) do vpc com este nome
para entao no arquivo main.tf da vm fazer a importação deste, referenciado o valor do subnet_id
com a sintaxe acima.
*/