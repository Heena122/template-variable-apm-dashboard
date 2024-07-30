# Configure terraform
terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
    }
  }
}

# Configure the New Relic provider
provider "newrelic" {
  account_id = 4438263
  api_key = "NRAK-0L16I8F2GHN8C3YTNELXKYB15QU"    # Usually prefixed with 'NRAK'
  region = "US"                    # Valid regions are US and EU
}