#
# Part 03: Alerts
#

resource "newrelic_alert_policy" "policy" {
  name                = "My alert policy"
  incident_preference = "PER_CONDITION"
}

resource "newrelic_nrql_alert_condition" "availability" {
  policy_id                      = newrelic_alert_policy.policy.id
  name                           = "Website availability"

  nrql {
    query = "SELECT count(*) FROM SyntheticCheck FACET monitorName"
  }

  critical {
    operator              = "equals"
    threshold             = 0
    threshold_duration    = 300
    threshold_occurrences = "all"
  }
}

resource "newrelic_nrql_alert_condition" "performance" {
  policy_id                      = newrelic_alert_policy.policy.id
  name                           = "Website performance"

  nrql {
    query = "SELECT average(duration) FROM SyntheticCheck"
  }

  critical {
    operator              = "above"
    threshold             = 60
    threshold_duration    = 300
    threshold_occurrences = "all"
  }

  warning {
    operator              = "above"
    threshold             = 60
    threshold_duration    = 300
    threshold_occurrences = "all"
  }
}

resource "newrelic_nrql_alert_condition" "errors" {
  policy_id                      = newrelic_alert_policy.policy.id
  name                           = "Website errors"

  nrql {
    query = "SELECT count(*) FROM SyntheticCheck WHERE error IS NOT NULL WHERE monitorName = '${newrelic_synthetics_monitor.browser.name}'"
  }

  critical {
    operator              = "above"
    threshold             = 0
    threshold_duration    = 300
    threshold_occurrences = "all"
  }
}
