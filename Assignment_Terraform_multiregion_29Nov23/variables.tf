# ---root/variables.tf---

variable "regions" {
  description = "List of AWS regions"
  type        = list(string)
  default     = ["us-east-1", "us-west-2"]
}
