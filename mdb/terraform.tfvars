#=========== main ==============
cloud_id  = "b1gk4emes5rkqds921v9"                          #"$YOUR_VARIABLE"
folder_id = "b1gqlm96s1bedr3p9nu1"                          #"$YOUR_VARIABLE"

#=========== terraform_remote_state ==============
network_state_key   = "my-project-network.tfstate"
network_bucket_name = "backbuck"                          #"$YOUR_VARIABLE"

#=========== mysql_cluster ==============
mdb_name = "mysql_wordpress"
mdb_env  = "PRESTABLE"
mdb_ver  = "8.0"

mdb_platform  = "s2.micro"
mdb_disk_type = "network-ssd"
mdb_disk_size = 16

maintenance_type = "WEEKLY"
maintenance_day  = "SAT"
maintenance_hour = 12

mdb_base_name = "one_of_one"
user_name     = "evgen"
user_pass     = "12345678"
user_roles    = ["ALL"]
