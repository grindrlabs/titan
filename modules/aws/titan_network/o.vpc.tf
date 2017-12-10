# TITAN Network Module - VPC Outputs

output "id" {
  value = "${var.network_id}"

  description = <<-EOF
    Synonym for `network_id`, the second IP octet uniquely identifying this TITAN network.
  EOF
}

output "network_id" {
  value = "${var.network_id}"

  description = <<-EOF
    The second IP octet uniquely identifiing this TITAN network.
  EOF
}

output "octet_0" {
  value = 10

  description = <<-EOF
    The first octet of this TITAN network's space.

    In compliance with RFC 1918, the first octet is hard-coded to 10, as this is the only reserved address block which
    is a `/8` dedicated to private networking.
  EOF
}

output "octet_1" {
  value = "${var.network_id}"

  description = <<-EOF
    Synonym for `network_id`, the second IP octet uniquely identifying this TITAN network.
  EOF
}
