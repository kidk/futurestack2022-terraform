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

Below are a couple of queries + widget type you can use in your dashboard. Feel free to use the example on the documentation, and change it to your hearts desire. There's a nice reference dashboard again you can look it if you want, you can find it in the `reference/04-dashboard/dashboard.tf` file

Queries:
- Bar or Table: SELECT percentage(count(*), WHERE result = 'SUCCESS') FROM SyntheticCheck FACET monitorName SINCE 1 day ago
- Bar or Table: SELECT percentage(count(*), WHERE result = 'SUCCESS') FROM SyntheticCheck SINCE 1 day ago FACET locationLabel
- Line or Area: SELECT average(duration), max(duration), min(duration) FROM SyntheticCheck FACET monitorName TIMESERIES AUTO SINCE 1 HOUR AGO
- Table: SELECT timestamp, monitorName, locationLabel, error FROM SyntheticCheck WHERE result = 'FAILED' SINCE 1 day ago

Once you're done and happy you can click on 'Check' (bottom right of your screen) to continue.


1) Check if the website is available: SELECT count(*) FROM SyntheticCheck FACET monitorName
2) Check if the website is performing well: SELECT average(duration) FROM SyntheticCheck FACET monitorName
3) Check if we have any errors: SELECT count(*) FROM SyntheticCheck WHERE error IS NOT NULL FACET monitorName
