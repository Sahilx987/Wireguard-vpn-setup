resource "aws_security_group" "vpn_sg" {
    name = "vpn-server-sg"
    vpc_id = aws_vpc.main.id

    ingress {
        description = "wireguard VPN"
        from_port = 51820
        to_port = 51820
        protocol = "udp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "SSH from my ip only"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = { Name = "vpn-server-sg" }

}


// private server sg

resource "aws_security_group" "private_sg" {
    name = "private-server-sg"
    vpc_id = aws_vpc.main.id

    ingress {
        description = "SSH from VPN tunnel only"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["10.0.1.0/24"] //wireguard vpn range
    }

    ingress {
    description = "ICMP ping from VPN"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]  # ✅ Ping allow karo
    }


    egress { 
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = { Name = "private-server-sg" }

}

