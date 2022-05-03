resource "newrelic_one_dashboard" "exampledash" {
  name = "New Relic Synthetics Example"

  page {
    name = "New Relic Synthetics Example"

    widget_bar {
      title = "Synthetic Success Percentage"
      row = 1
      column = 1
      width = 6
      height = 3

      nrql_query {
        query       = "SELECT percentage(count(*), WHERE result = 'SUCCESS') FROM SyntheticCheck FACET monitorName SINCE 1 day ago"
      }
    }

    widget_bar {
      title = "Success Percentage By Location"
      row = 1
      column = 7
      width = 6
      height = 3

      nrql_query {
        query       = "SELECT percentage(count(*), WHERE result = 'SUCCESS') FROM SyntheticCheck SINCE 1 day ago FACET locationLabel"
      }
    }

    widget_line {
      title = "Success Percentage By Location"
      row = 4
      column = 1
      width = 6
      height = 3

      nrql_query {
        query       = "SELECT average(duration), max(duration), min(duration) FROM SyntheticCheck FACET monitorName TIMESERIES AUTO SINCE 1 HOUR AGO"
      }
    }

    widget_table {
      title = "Monitor Failures"
      row = 4
      column = 7
      width = 6
      height = 3

      nrql_query {
        query       = "SELECT timestamp, monitorName, locationLabel, error FROM SyntheticCheck WHERE result = 'FAILED' SINCE 1 day ago"
      }
    }
  }
}
