variable "aws_region" {  //this variable defines the region
 default = "ap-south-1" 
}

variable "my_public_ip" {   //this variable defines the public ip
    description = "103.77.43.217" //public ip of local machine
    type = string
}

variable "key_pair_name" {  //this variable defines the key pair
    description = "key pair name"
    type = string
}
