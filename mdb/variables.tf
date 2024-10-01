#=========== main ==============
variable "cloud_id" {
  description = "The cloud ID"
  type        = string
}
variable "folder_id" {
  description = "The folder ID"
  type        = string
}
variable "default_zone" {
  description = "The default zone"
  type        = string
  default     = "ru-cenral1-a"
}

#=========== terraform_remote_state ==============
variable "network_state_key" {
  description = "The key of state for the network."
  type        = string
  default     = null
}

variable "network_bucket_name" {
  description = "The name of bucket for the network."
  type        = string
  default     = null
}

#=========== mysql_cluster ==============
variable "mdb_name" {
  description = "Name of a specific mdb cluster."
  type        = string
  default     = null
}

variable "mdb_env" {
  description = "Environment of a specific mdb cluster."
  type        = string
  default     = null
}
variable "mdb_ver" {
  description = "Version of a specific mdb cluster."
  type        = string
  default     = null
}
variable "mdb_platform" {
  description = "Preset of a specific mdb cluster."
  type        = string
  default     = null
}

variable "mdb_disk_type" {
  description = "Preset disk type of a specific mdb cluster."
  type        = string
  default     = null
}

variable "mdb_disk_size" {
  description = "Preset disk size of a specific mdb cluster."
  type        = string
  default     = null
}

variable "maintenance_type" {
  description = "Preset maintenance window of a specific mdb cluster."
  type        = string
  default     = null
}

variable "maintenance_day" {
  description = "Maintenance day of a specific mdb cluster."
  type        = string
  default     = null
}

variable "maintenance_hour" {
  description = "Maintenance hours of a specific mdb cluster."
  type        = string
  default     = null
}

variable "mdb_base_name" {
  description = "Name for data base of mdb cluster."
  type        = string
  default     = null
}

variable "user_name" {
  description = "User name of data base."
  type        = string
}

variable "user_pass" {
  description = "Password of user data base."
  type        = string
}

variable "user_roles" {
  description = "Role of user data base."
  type        = list(string)
}
