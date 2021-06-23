variable "region" {
    description = ""
    type = "string"
    default = "us-east-1"
}

variable "aZone" {
    description = "US East (N. Virginia)"
    type = "string"
    default = "us-east-1b"
}

variable "sshKeyName" {
    description = "ssh key"
    type = "string"
    default = "sgm"
}

variable "instanceCount" {
    description = "Count of instances"
    type = "string"
    default = "2"
}

variable "volumeSize" {
    description = "The volume size for the root volume in GiB"
    type    = "string"
    default = "12"
}

variable "vpcCidr" {
    description = "Project subnet"
    type = "string"
    default = "192.168.168.0/26"
}
variable "cidr" {
    description = "Project subnet"
    type = "string"
    default = "192.168.168.0/26"
}

variable "instanceType" {
    description = "Instance type"
    type = "string"
    default = "m5.large"
}

variable "mainIP" {
    description = "Remote access address"
    type = "string"
    default = "15.18.188.18/32"
}
