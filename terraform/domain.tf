# resource "digitalocean_domain" "thanhhoang" {
#   name = "thanhhoang.tech"
# }

# resource "digitalocean_record" "kui" {
#   domain = digitalocean_domain.thanhhoang.name
#   type   = "A"
#   name   = "kui"
#   value  = "digitalocean_droplet.kafka.ipv4_address"
# }

# resource "digitalocean_record" "ssl" {
#   domain = digitalocean_domain.thanhhoang.name
#   type   = "A"
#   name   = "ssl"
#   value  = "digitalocean_droplet.kafka.ipv4_address"
# }

# resource "digitalocean_record" "broker" {
#   domain = digitalocean_domain.thanhhoang.name
#   type   = "A"
#   name   = "broker"
#   value  = "digitalocean_droplet.kafka.ipv4_address"
# }