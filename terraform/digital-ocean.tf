resource "digitalocean_ssh_key" "default" {
  name       = "DO Default SSH Key"
  public_key = var.ssh_public_key
}

resource "digitalocean_droplet" "kafka" {
  image     = "ubuntu-20-04-x64"
  name      = "kafka"
  region    = "sgp1"
  size      = "s-1vcpu-2gb"
  ssh_keys  = [digitalocean_ssh_key.default.fingerprint]
  user_data = file("kafka-server.sh")
}

# resource "digitalocean_firewall" "kafka-filewall" {
#   name = "kafka"

#   droplet_ids = [digitalocean_droplet.kafka.id]

#   inbound_rule {
#     protocol         = "tcp"
#     port_range       = "22"
#     source_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   inbound_rule {
#     protocol         = "tcp"
#     port_range       = "8080"
#     source_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   inbound_rule {
#     protocol         = "tcp"
#     port_range       = "9092"
#     source_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   inbound_rule {
#     protocol         = "tcp"
#     port_range       = "19092"
#     source_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   inbound_rule {
#     protocol         = "tcp"
#     port_range       = "29092"
#     source_addresses = ["0.0.0.0/0", "::/0"]
#   }
# }
