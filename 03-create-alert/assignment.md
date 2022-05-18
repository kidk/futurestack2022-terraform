---
slug: create-alert
id: gp5qn8ntc4pl
type: challenge
title: Creating an alert
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

Now that we have some checks running against our website it would be great if we could get alerted when the website is slow, or even worse not available. For that we're going to use the New Relic Alert system.

To cover all of our alert cases we need 3 types of alerts:

1) Check if the website is available: `SELECT count(*) from SyntheticCheck where result='FAILED' facet monitorName`
2) Check if the website is performing well: `SELECT average(duration) FROM SyntheticCheck FACET monitorName`
3) Check if we have any errors: `SELECT count(*) FROM SyntheticCheck WHERE error IS NOT NULL FACET monitorName`

Open `alerts.tf` and take a look at the following documentation. To configure these alerts you will need to set up an alert policy, and a nrql alert condition for each alert defined above.

Documentation:
- [alert_policy](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/alert_policy)
- [nrql_alert_condition](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/nrql_alert_condition)

If you get stuck, you can always take a quick view at the `reference/03-create-alert/alerts.tf` file.

If you've configured everything you can test your set up with `terraform plan` and `terraform apply`. Make sure to check out the result of your work in [New Relic](https://one.newrelic.com/nrai/alerts-classic/policies)

Challenge: The alerts above will work on all Synthetics checks that run in your accounts because of the `FACET monitorName` in the NRQL query. What if we want to only run it on the Synthetics check we created with Terraform? In addition what if we don't want to hardcode the value of the Synthetics check name? Hint: `newrelic_synthetics_monitor.{name of resource}.name` in combination with `WHERE monitorName = ''` for the query should get you started.

Once you're done you can click on 'Check' (bottom right of your screen) to continue.
