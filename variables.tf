variable "subscription" {}

variable "product" {
  description = "The name of your application"
  default     = "docmosis"
}

variable "env" {
  description = "The deployment environment (sandbox, aat, prod etc..)"
}

variable "location" {
  description = "The location where you would like to deploy your infrastructure"
  default     = "UK South"
}

variable "common_tags" {
  type = map(string)
}

variable "jenkins_AAD_objectId" {
  description = "This is the ID of the Application you wish to give access to the Key Vault via the access policy"
}

variable "team_contact" {
  description = "The name of your Slack channel people can use to contact your team about your infrastructure"
  default     = "#Cloud-Native"
}

variable "daily_data_cap_in_gb" {
  description = "Specifies the Application Insights component daily data volume cap in GB"
  default     = 100
}

variable "alert_limit_reached" {
  description = "Specifies whether the limit of 100 Activity Log Alerts has been met in the current subscription. Setting to true will create a Log Search Alert instead"
  type       = bool
  default    = false
}