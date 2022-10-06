resource "digitalocean_vpc" "infra-clusters" {
  name        = "${var.prefix}-infra-clusters"
  region      = var.region_server
}

resource "tls_private_key" "priv-key" {
  algorithm   = "RSA"
}

resource "digitalocean_ssh_key" "pub-key" {
  name        = "${var.prefix}-cluster-nodes-key"
  public_key  = tls_private_key.priv-key.public_key_openssh
}

resource "local_file" "id_rsa" {
    content  = tls_private_key.priv-key.private_key_pem
    filename = "id_rsa.pem"
}
