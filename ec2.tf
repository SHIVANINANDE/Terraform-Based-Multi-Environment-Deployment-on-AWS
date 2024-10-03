#for ec2 we need VPC, Key-pair, security group
resource "aws_key_pair" "deployer" {
  key_name = "shivani-terra-key"
#   public_key = file("C:\\Users\\My Pc\\Desktop\\OOP_example\\DevOps\\Terraform\\terra-key")
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8K2YriJ8Tpt5iNZOPUafXDril2WMo9wzvzSKDmdJ8B0Oo/wMZr01dOf5NKGxca/p2NYqP+g8OlBBy6Eaxq5dJrPAHfbazeAB+h6VRYQrUHOiBKRB8+6xlGpojNUSRhdDaA8YgW0IgrpaAPYJDG3oCIQd8zJ7gAZHARBhUAUc8pZag97OQLS+nqr9rPSq8ERaNctrj+wVNciOwWg0ii+HCzZ7PloWYEdbGqhMVaXifUSJwd/RG7179KewYyy3DoJLacoPoL9rxzgkihGRBPdh97NFUQ+65sMEg8YmvjV77UZSY1W7qazVxB7LkiSYtFPeDJLEP889qwkzlk9zvoLUkQFmGlkBxD+InTidDotDiH2oTtsSYcwsn3AxAQyyk4VXCV+vkuA9u7IYmO3WuJzDHGyjZUkRo0SceFf9oOlzQ2ndQyxyp8T34XyYLN9E7zWkL8HN/44D7vpcO+iMVHw2PNaAy0Q2ibd+aslGikr9LczHxkOjJQWsnXHupVhxXb7c= my pc@DESKTOP-N09AG2N"

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