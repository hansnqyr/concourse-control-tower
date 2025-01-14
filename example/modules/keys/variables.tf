variable "name" {
  description = "The name for the keys bucket"
}

variable "concourse_keys_version" {
  description = "Change this if you want to re-generate Concourse keys"
  default     = "1"
}

variable "generate_keys" {
  description = "If set to `true` this module will generate the necessary RSA keys with the [`tls_private_key`](https://www.terraform.io/docs/providers/tls/r/private_key.html) resource and upload them to S3 (server-side encrypted). **Be aware** that this will store the generated *unencrypted* keys in the Terraform state, so be sure to use a secure state backend (e.g. S3 encrypted), or set this to `false` and generate the keys manually"
  default     = true
}

variable "bucket_force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable"
  default     = true
}

variable "tags" {
  description = "aws resource tags"
  default = {}
}
