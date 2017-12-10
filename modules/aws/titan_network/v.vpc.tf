# TITAN Network Module - VPC Variables

variable "instance_tenancy" {
  default = "default"
  description = <<-EOF
    Instance tenancy for EC2 instances launched in this TITAN network's VPC.

    Default: `default`.

    See: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html
  EOF
}

variable "network_id" {
  description = <<-EOF
    The second octet to use for this TITAN network.

    In compliance with RFC 1918, the first octet is hard-coded to 10, as this is the only reserved address block which
    is a `/8` dedicated to private networking. This `network_id` is the second octet and is used to create a `/16` for
    this TITAN network.
  EOF
}
