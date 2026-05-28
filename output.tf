output "vpn_server_public_ip" {
    value = aws_instance.vpn_server.public_ip
    description = "Connect WireGuard to this IP"
  
}

output "private_server_private_ip" {
    value = aws_instance.private_server.private_ip
    description = "SSh to this IP through WireGuard"
  
}

output "vpc_id" {
  value = aws_vpc.main
}