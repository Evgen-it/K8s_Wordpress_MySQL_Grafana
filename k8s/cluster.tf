resource "yandex_kubernetes_cluster" "k8s-regional" {
  name                    = var.cluster_name
  network_id              = local.network_output.network_id
  network_policy_provider = var.network_policy_provider
  service_account_id      = yandex_iam_service_account.myaccount.id
  node_service_account_id = yandex_iam_service_account.myaccount.id
  master {
    version   = var.master_version
    public_ip = var.master_public_ip
    regional {
      region = var.master_region
      dynamic "location" {
        for_each = local.network_output.k8s_masters_subnet_info
        content {
          zone      = location.value["zone"]
          subnet_id = location.value["subnet_id"]
        }
      }
    }
     master_logging {
     enabled                    = var.master_logging_enabled
     folder_id                  = var.folder_id
     kube_apiserver_enabled     = false
     cluster_autoscaler_enabled = true
     events_enabled             = true
     audit_enabled              = false
   }
    security_group_ids = [local.network_output.sg_internal, local.network_output.sg_k8s_master]
  }  
  kms_provider {
    key_id = yandex_kms_symmetric_key.kms-key.id
  }
  depends_on = [
    yandex_resourcemanager_folder_iam_binding.editor,
    yandex_resourcemanager_folder_iam_binding.images-puller
  ]
}