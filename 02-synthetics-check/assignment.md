---
slug: synthetics-check
id: rplkogkibahj
type: challenge
title: Creating a Synthetics check
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

Now that our Terraform environment is configured and ready to go, let's start with our first challenge. Acme Telco (our company) has a very important website they want to monitor and make sure it's able to meet customer expectations. There's been lots of complains about downtime, slow pages, and most importantly users are not buying our new phones.

You can check out the website here: http://webportal.telco.nrdemo.com/

To start monitoring if our website is up let's start by creating a couple of Synthetics checks to monitor the most important pages of our website. Use the documentation (below) and the `synthetics.tf` file to start building your own checks. We want to check the uptime of a couple of pages, and we want to run the `example.js` script continously to validate the check out process.

Documentation:
- [synthetics_monitor](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/synthetics_monitor)
- [synthetics_monitor_script](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/synthetics_monitor_script)

Tasks:
1) Create a simple check for `http://webportal.telco.nrdemo.com/`
2) Create a browser check for `http://webportal.telco.nrdemo.com/browse/phones`
3) Create a script check with the `example.js` script in the `/home/terraform/` folder

You can set the location to `AWS_US_EAST_1` and the `frequency` to 5 minutes.

Feel free to add other options to simple and browser check like: `validation_string`, and `sla_threshold`.

If you get stuck, you can always take a quick view at the `reference/02-synthetics-check/synthetics.tf` file.

If you've configured everything you can test your set up with `terraform plan` and `terraform apply`. Make sure to check out the result of your work in [New Relic](https://one.newrelic.com/synthetics-nerdlets)

Once you're done you can click on 'Check' (bottom right of your screen) to continue.
