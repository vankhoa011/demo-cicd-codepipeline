variable "instance_type" {
  type = "string"
  default = "t2.medium"
}

variable "ami_image" {
  type = "string"
  default = "ami-09568291a9d6c804c"
}

variable "ecs_key" {
  type = "string"
  default = "demo"
}

variable "github_oauth_token" {
  description = "GitHub Oauth Token with permissions to access private repositories"
}

variable "repo_owner" {
  description = "GitHub Organization or Person name"
}

variable "repo_name" {
  description = "GitHub repository name of the application to be built (and deployed to Elastic Beanstalk if configured)"
}

variable "branch" {
  description = "Branch of the GitHub repository, _e.g._ ``master``"
  default = "master"
}

variable "poll_source_changes" {
  type        = "string"
  default     = "true"
  description = "Periodically check the location of your source content and run the pipeline if changes are detected"
}

variable "vpc_cidr" {
  description = "VPC cidr block. Example: 10.0.0.0/16"
}

variable "private_subnet_ids" {
  type        = "list"

}

variable "vpc_id" {
  
}
variable "public_subnet_ids" {
  type        = "list"
}

