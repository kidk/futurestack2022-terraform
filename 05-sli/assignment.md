---
slug: sli
id: hsleycvhxq0c
type: challenge
title: Creating an SLI
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

Great work! We now have a dashboard, alert, and synthetics check for our important website. Bad news though, our boss just called and management wants to set an SLI for the website, to prove to our customers that we're hitting our goals.

To be able to do so, we will need a GUID for one of our Synthetic checks. As the checkout check is the most important let's choose that one. We will use the data sources feature of Terraform to get this information. Data sources are a handy feature if you want to get data from somewhere, without making changes. Like in our case we want the Synthetics check information, but we don't want to make changes.

For this use case we are going to use [entity](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/data-sources/entity). Create an entity by looking up the name of your synthetic check, with `domain` set to `SYNTH` and `type` set to `MONITOR`. Tip use resource reference like we did for the dashboard url (`newrelic_synthetics_monitor.{name of check}.name`).

Next up we want to use [service_level](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/service_level) resource. Take a look at the example, and try to figure out how to configure it. You can now use the entity information you've fetched with `data.newrelic_entity.guid`. Below is a list of variables you can use, feel free to play with them if you want.

- account_id: `var.NEW_RELIC_CHECK_ACCOUNT_ID`
- valid_events
  - from: SyntheticCheck
- good_events
  - from: SyntheticCheck
  - where: result='SUCCESS'

If you get stuck, you can always take a quick view at the `reference/05-sli/sli.tf` file.

Once you're done and happy you can click on 'Check' (bottom right of your screen) to continue.
