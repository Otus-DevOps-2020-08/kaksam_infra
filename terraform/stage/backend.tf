terraform {
  backend "s3" {
    endpoint                    = "storage.yandexcloud.net"
    bucket                      = "terraform-state-3"
    region                      = "ru-central1"
    key                         = "stagw/terraform.tfstate"
    access_key                  = "Rc1CZJ8alBQegM0SP1Mx"
    secret_key                  = "7UR_nkYo9yJRkwiYxnndTryDL3ueF3txP3R-9FhZ"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
