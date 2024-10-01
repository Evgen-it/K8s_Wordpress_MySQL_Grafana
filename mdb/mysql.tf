resource "yandex_mdb_mysql_cluster" "MySQL" {
  name                = var.mdb_name
  environment         = var.mdb_env
  network_id          = local.network_output.network_id
  version             = var.mdb_ver
  security_group_ids  = [local.network_output.sg_mdb]

  resources {
    resource_preset_id = var.mdb_platform
    disk_type_id       = var.mdb_disk_type
    disk_size          = var.mdb_disk_size
  }

  maintenance_window {
    type = var.maintenance_type
    day  = var.maintenance_day
    hour = var.maintenance_hour
  }

  dynamic "host" {
    for_each = local.network_output.mdb_subnet_info
    content {
      zone      = host.value["zone"]
      subnet_id = host.value["subnet_id"]
    }
  }
}

resource "yandex_mdb_mysql_database" "db" {
  cluster_id = yandex_mdb_mysql_cluster.MySQL.id
  name       = var.mdb_base_name
}

resource "yandex_mdb_mysql_user" "mdb_admin" {
  cluster_id            = yandex_mdb_mysql_cluster.MySQL.id
  name                  = var.user_name
  password              = var.user_pass
  authentication_plugin = "MYSQL_NATIVE_PASSWORD"
  permission {
    database_name = yandex_mdb_mysql_database.db.name
    roles         = var.user_roles
  }
}