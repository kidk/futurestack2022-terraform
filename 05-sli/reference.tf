
data "newrelic_entity" "synthetics_check" {
  name = newrelic_synthetics_monitor.simple.name
  domain = "SYNTH"
  type = "MONITOR"
}

resource "newrelic_service_level" "website-availability" {
    guid = data.newrelic_entity.synthetics_check.guid
    name = "Website availability"
    description = "Availability of the checkout flow"

    events {
        account_id = var.NEW_RELIC_CHECK_ACCOUNT_ID
        valid_events {
            from = "SyntheticCheck"
        }
        good_events {
            from = "SyntheticCheck"
            where = "result='SUCCESS'"
        }
    }

    objective {
        target = 99.00
        time_window {
            rolling {
                count = 7
                unit = "DAY"
            }
        }
    }
}
