##############################Default##############################
variable "profile" { default = "sigma_nom-dev" }
variable "credentials_file" { default = "~/.aws/credentials" }
variable "region" { default = "us-west-2" }
###################################################################
variable "namespace" { default = "nom" }
variable "stage" { default = "dev" }
variable "name" { default = "ssm-flask" }

##############################SSM-Parameters##############################
variable "ssm-flask_db_nom-name" { default = "/flask-0001/db/nomcore_db_url" }
variable "ssm-flask_db_nom-value" { default = "" }
