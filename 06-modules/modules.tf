#
# Part 06: Modules
#

variable "NEW_RELIC_CHECK_ACCOUNT_ID" {}

module "website-monitoring-newrelic" {
  source = "./modules/website-monitoring"

  website = "https://www.newrelic.com"

  # We pass through the account ID to use it later
  NEW_RELIC_CHECK_ACCOUNT_ID = var.NEW_RELIC_CHECK_ACCOUNT_ID
}

module "website-monitoring-newrelic-docs" {
  source = "./modules/website-monitoring"

  website = "https://docs.newrelic.com/"

  # We pass through the account ID to use it later
  NEW_RELIC_CHECK_ACCOUNT_ID = var.NEW_RELIC_CHECK_ACCOUNT_ID
}

module "website-monitoring-newrelic-opensource" {
  source = "./modules/website-monitoring"

  website = "https://opensource.newrelic.com/"

  # We pass through the account ID to use it later
  NEW_RELIC_CHECK_ACCOUNT_ID = var.NEW_RELIC_CHECK_ACCOUNT_ID
}

module "website-monitoring-newrelic-developer" {
  source = "./modules/website-monitoring"

  website = "https://developer.newrelic.com/"

  # We pass through the account ID to use it later
  NEW_RELIC_CHECK_ACCOUNT_ID = var.NEW_RELIC_CHECK_ACCOUNT_ID
}
