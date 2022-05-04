---
slug: modules
id: t4qgmxrb3nmo
type: challenge
title: Using modules
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

Again great work! We now have an SLI that will tell us exactly how the website is performing, and we can use that to prove to our customers that everything is working as expected.

Bad news though, our boss was so happy with our work, they now want to do the same for 10 others websites: https://www.newrelic.com, https://docs.newrelic.com/, https://opensource.newrelic.com/, https://developer.newrelic.com/, https://www.google.com, https://www.terraform.io/, https://github.com/, https://www.microsoft.com/, https://about.gitlab.com/, https://www.pulumi.com/

Well, better get to work copy pasting all of our code, again and again to so we can monitor everything. But what if there's a better way: [Modules!](https://www.terraform.io/language/modules) Modules are containers for multiple resources that are used together, and are the go to way to package and reuse resource configurations in Terraform.

We moved all of our code into a modules directory `modules/website-monitoring/` and added `modules.tf` file with some preconfired configuration. Take a look at both files.

Your task is now to:
- Open `modules/website-monitoring/variable.tf` and define the `website` variable as [input variable](https://www.terraform.io/language/values/variables) for this config.
- Change the `modules/website-monitoring/synthetics.tf` file so it only contains a ping check, and uses the website variable. It's ok to remove the other checks.
- Review all other tf files so they use references to other resources, and right variables for alerts

If you're ready, run `terraform init` again so Terraform initialises our module, and after `terraform apply`. Make sure to review your changes so it matches up with your expecations. You can also always check in New Relic if you're getting everything you need. If you spot a mistake, it's sometimes best to do a `terraform destroy` before making the changes.

This will be a challenge, so don't worry if it doesn't work from the first go. Use your search engine skills, or raise your hand if you get stuck.

Good luck! Once you're done and happy you can click on 'Check' (bottom right of your screen) to continue.