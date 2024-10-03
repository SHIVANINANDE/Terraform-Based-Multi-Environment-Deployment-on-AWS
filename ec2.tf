#for ec2 we need VPC, Key-pair, security group
resource "aws_key_pair" "deployer" {
  key_name = "shivani-terra-key"
  public_key = file("C:\\Users\\My Pc\\Desktop\\OOP_example\\DevOps\\Terraform\\terra-key")
    

}
#Default VPC
resource "aws_default_vpc" "default" {
  
}
#we need security group to do ssh and open port 22
resource "aws_security_group" "shivanisecurity" {
  name="allow-ports"
  description = "this security group is to allow traffic"
  vpc_id = aws_default_vpc.default.id

  ingress {
    description = "this is for ssh"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "name" {
  ami="ami-0ea3c35c5c3284d82"
  instance_type = "t2.micro"
  key_name=aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.shivanisecurity.name]
  tags={
    Name="terra-automate"
  }
}
