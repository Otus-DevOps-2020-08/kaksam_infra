terraform {
  backend "s3" {
    endpoint                    = "storage.yandexcloud.net"
    bucket                      = "terraform-state-3"
    region                      = "ru-central1"
    key                         = "prod/terraform.tfstate"
    access_key                  = "a_k"
    secret_key                  = "s_k"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
