//vpn server - public subnet

resource "aws_instance" "vpn_server" {

  ami = "ami-0f58b397bc5c1f2e8"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.vpn_sg.id]
  key_name = var.key_pair_name

//disbale source/destination check

    source_dest_check = false
    tags = {Name="wireguard-vpn-server"}

}

resource "aws_instance" "private_server" {
    ami = "ami-0f58b397bc5c1f2e8"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.private.id
    vpc_security_group_ids = [aws_security_group.private_sg.id]
    key_name = var.key_pair_name

    tags = {Name="private-ec2-server"}
  
}
