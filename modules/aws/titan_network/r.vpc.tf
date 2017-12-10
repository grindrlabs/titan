# TITAN Network Module - VPC Resources

# VPC
resource "aws_vpc" "vpc" {
  cidr_block = "10.${var.network_id}.0.0/16"
  instance_tenancy = "${var.instance_tenancy}"

  assign_generated_ipv6_cidr_block = true

  enable_classiclink = false
  enable_dns_hostnames = true
  enable_dns_support = true

  tags {
    Name = "${var.name_short}.${var.domain}"
    titan_network = "${var.name}"
    titan_zone = "${var.name_short}.${var.domain}"
  }
}

# The VPC's DHCP Options Set
resource "aws_vpc_dhcp_options" "default" {
  domain_name = "${var.name_short}.${var.domain}"
  domain_name_servers = ["AmazonProvidedDNS"]
  ntp_servers = []
  netbios_name_servers = []
  netbios_node_type = 2

  tags {
    Name = "${var.name_short}.${var.domain}"
    titan_network = "${var.name}"
    titan_zone = "${var.name_short}.${var.domain}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Associate the DHCP Options Set with the VPC
resource "aws_vpc_dhcp_options_association" "default" {
  vpc_id = "${aws_vpc.default.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.default.id}"
}
