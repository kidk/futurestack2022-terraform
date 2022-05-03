---
slug: dashboard
id: ii5kayd6d250
type: challenge
title: Creating a dashboard
tabs:
- title: Shell
  type: terminal
  hostname: container
- title: Editor
  type: code
  hostname: container
  path: /home/terraform
difficulty: basic
timelimit: 600
---

Great work! Now we will know when our website is down, performing badly or throwing errors. But wouldn't it be great if we can track the performance data on a dashboard? It would give us real time insight into the performance and gives us an excuse to finally order that 65 inch TV we wanted for the office.

Let's take a look at the documentation: [one_dashboard](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/one_dashboard)

Below are a couple of queries + widget type you can use in your dashboard. Feel free to use the example on the documentation, and change it to your hearts desire. There's a nice reference dashboard again you can look it if you want, you can find it in the `reference/04-dashboard/dashboard.tf` file. Don't forget to run `terraform apply` once you've made changes to your code.

Queries:
- Bar or Table: SELECT percentage(count(*), WHERE result = 'SUCCESS') FROM SyntheticCheck FACET monitorName SINCE 1 day ago
- Bar or Table: SELECT percentage(count(*), WHERE result = 'SUCCESS') FROM SyntheticCheck SINCE 1 day ago FACET locationLabel
- Line or Area: SELECT average(duration), max(duration), min(duration) FROM SyntheticCheck FACET monitorName TIMESERIES AUTO SINCE 1 HOUR AGO
- Table: SELECT timestamp, monitorName, locationLabel, error FROM SyntheticCheck WHERE result = 'FAILED' SINCE 1 day ago

Now that we've created our dashboard it would be great if we can get the url to it. To do that you can add the following snippet to your code.

```
output "dashboard_url" {
  description = "Url of the dashboard we created"
  value       = newrelic_one_dashboard.{name}.permalink
}
```

Don't forget to replace `{name}` before `terraform apply`. The `{name}` comes from the resource, so for example `resource "newrelic_one_dashboard" "exampledash"` will have the name `exampledash`. You can change this name to anything. It's a great way to reference other resources within Terraform.

Once you're done and happy you can click on 'Check' (bottom right of your screen) to continue.
