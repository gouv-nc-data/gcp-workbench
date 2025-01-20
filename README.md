# gcp-workbench
Module pour créer un workbench connecté au VPC

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_member.workbench_sa_roles](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.workbench_api_services](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.workbench_sa](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_workbench_instance.workbench_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workbench_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | n/a | `string` | `"n2-standard-2"` | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | id du projet | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"europe-west1"` | no |
| <a name="input_start_on_subnet"></a> [start\_on\_subnet](#input\_start\_on\_subnet) | n/a | `bool` | `true` | no |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | n/a | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->