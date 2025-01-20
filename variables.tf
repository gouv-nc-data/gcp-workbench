variable "project_id" {
  type        = string
  description = "id du projet"
}

variable "region" {
  type    = string
  default = "europe-west1"
}

variable "start_on_subnet" {
  type    = bool
  default = true
}

variable "subnet" {
  type    = string
  default = ""
}

variable "machine_type" {
  type    = string
  default = "n2-standard-2"
}
