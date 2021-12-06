variable "P11-provider" {
    default = "eu-west-2"
    description = "P11-provider"
    type =string
}

variable "P11VPC-nametag" {
    default = "projec11VPC"
    description = "P11VPC-nametag"
    type =string
}
variable "project11VPC" {
    default = "10.0.0.0/16"
    description = "project11VPC"
    type =string
}
variable "p11-pubsub1-cidr" {
    default = "10.0.0.0/24"
    description = "p11-pubsub1-cidr"
    type =string
}

variable "p11-pubsub1-name" {
    default = "p11-pubsub1"
    description = "p11-pubsub1-name"
    type =string
}

variable "p11-pubsub2-cidr" {
    default = "10.0.1.0/24"
    description = "p11-pubsub2-cidr"
    type =string
}

variable "p11-pubsub2-name" {
    default = "p11-pubsub2"
    description = "p11-pubsub2-name"
    type =string
}

variable "p11-privsub1-name" {
    default = "p11-privsub1"
    description = "p11-privsub1-name"
    type =string
}

variable "p11-privsub1-cidr" {
    default = "10.0.2.0/24"
    description = "p11-privsub2-cidr"
    type =string
}

variable "p11-privsub2-cidr" {
    default = "10.0.3.0/24"
    description = "p11-privsub2-cidr"
    type =string
}

variable "p11-privsub2-name" {
    default = "p11-privsub2"
    description = "p11-privsub2-name"
    type =string
}

variable "p11-publicroutetable-name" {
    default = "p11-publicroutetable"
    description = "p11-publicroutetable-name"
    type =string
}
variable "p11-privateroutetable-name" {
    default = "p11-privateroutetable"
    description = "p11-publicroutetable-name"
    type =string
}

variable "Project11-igw-name" {
    default = "Project11-igw"
    description = "Project11-igw-name"
    type =string
}

variable "P11SG-tagname" {
    default = "allow-http"
    description = "P11SG-tagname"
    type =string
}

variable "my-p11rds-db-subnet-tagname" {
    default = "my-p11rds-db-subnet"
    description = "my-p11rds-db-subnet-tagname"
    type =string
}

variable "project11-alb-tagname" {
    default = "project11-alb"
    description = "project11-alb-tagname"
    type =string
}