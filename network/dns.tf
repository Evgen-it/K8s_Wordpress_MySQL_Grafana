resource "yandex_dns_zone" "zone-1" {
  name        = var.dns_zone_name
  zone        = var.domain_name
  public      = true
}

resource "yandex_dns_recordset" "rs-a1" {
  for_each   = yandex_vpc_address.public_addr
  zone_id    = yandex_dns_zone.zone-1.id
  name       = yandex_dns_zone.zone-1.zone
  ttl        = 300
  type       = "A"
  data       = [each.value.external_ipv4_address.0.address]
  depends_on = [yandex_vpc_address.public_addr]
}


