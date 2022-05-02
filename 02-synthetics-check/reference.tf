#
# Part 02: Synthetic check
#

resource "newrelic_synthetics_monitor" "simple" {
  name                      = "Load homepage"
  type                      = "SIMPLE"
  frequency                 = 5
  status                    = "ENABLED"
  locations                 = ["AWS_US_EAST_1"]

  uri                       = "http://webportal.telco.nrdemo.com/"
  validation_string         = "Welcome to Acme Telco"
}

resource "newrelic_synthetics_monitor" "browser" {
  name                      = "Load phone page"
  type                      = "BROWSER"
  frequency                 = 5
  status                    = "ENABLED"
  locations                 = ["AWS_US_EAST_1"]

  uri                       = "http://webportal.telco.nrdemo.com/browse/phones"
  validation_string         = "Acme Telco Phones"
}

resource "newrelic_synthetics_monitor" "script" {
  name                      = "Validate checkout"
  type                      = "SCRIPT_BROWSER"
  frequency                 = 5
  status                    = "ENABLED"
  locations                 = ["AWS_US_EAST_1"]
}

resource "newrelic_synthetics_monitor_script" "script" {
  monitor_id                = newrelic_synthetics_monitor.script.id
  text                      = file("${path.module}/example.js")
}
