#=========== main ==============
cloud_id  = "b1gk4emes5rkqds921v9"         #"$YOUR_VARIABLE"
folder_id = "b1gqlm96s1bedr3p9nu1"         #"$YOUR_VARIABLE"

#=========== network ==============
network_name = "skynet"

#=========== subnet ==============
subnets = {
  "k8s_masters" = [
    {
      name = "k8s_master_zone_a"
      zone = "ru-central1-a"
      cidr = ["10.0.1.0/28"]
    },
    {
      name = "k8s_master_zone_b"
      zone = "ru-central1-b"
      cidr = ["10.0.2.0/28"]
    },
    {
      name = "k8s_master_zone_d"
      zone = "ru-central1-d"
      cidr = ["10.0.3.0/28"]
    }
  ],
  "k8s_workers" = [
    {
      name = "k8s_worker_zone_a"
      zone = "ru-central1-a"
      cidr = ["10.0.4.0/28"]
    },
    {
      name = "k8s_worker_zone_b"
      zone = "ru-central1-b"
      cidr = ["10.0.5.0/28"]
    },
    {
      name = "k8s_worker_zone_d"
      zone = "ru-central1-d"
      cidr = ["10.0.6.0/28"]
    }
  ],
  "mdb_mysql" = [
    {
      name = "mdb_mysql_zone_a"
      zone = "ru-central1-a"
      cidr = ["10.0.7.0/28"]
    },
    {
      name = "mdb_mysql_zone_b"
      zone = "ru-central1-b"
      cidr = ["10.0.8.0/28"]
    },
    {
      name = "mdb_mysql_zone_d"
      zone = "ru-central1-d"
      cidr = ["10.0.9.0/28"]
    }
  ],
}

#=========== security_group ==============
white_ips_for_master = ["0.0.0.0/0"]

#=========== external_ip ==============
external_static_ips = {
  ingress_lb = [
    {
      name = "ingress_lb_ru_central1_a"
      zone = "ru-central1-a"
    }
  ]
}

#=========== dns ==============
dns_zone_name    = "public"
domain_name      = "filit.fun."
