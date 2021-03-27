variable "api_key" {}
variable "image" {}
variable "server_type" {}
variable "ssh_key" {}
variable "number_of_nodes" {}


# Configure the Hetzner Cloud Provider
terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.24.1"
    }
  }
}

provider "hcloud" {
  token = var.api_key
}

resource "hcloud_ssh_key" "default" {
  name = var.ssh_key
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "hcloud_server" "node" {
  count = var.number_of_nodes
  name = "node-${count.index}"
  image = var.image
  server_type = var.server_type
  ssh_keys = [var.ssh_key]
}

# generate inventory file for Ansible
resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tpl",
    {
        ipv4_address = hcloud_server.node.*.ipv4_address
    }
  )
  filename = "../../hosts.cfg"
}



output "server_ip_addresses" {
  value = {
      for instance in hcloud_server.node:
      instance.id => instance.ipv4_address
  }
}