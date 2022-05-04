---
slug: goodbye
id: ioyr229ajuxb
type: challenge
title: Goodbye
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

We did it. The website is now monitored, we have an alert if it fails, a great dashboard and SLI to show of our work. You now have the knowledge needed to build automation for any environment. Before we wrap up, we should clean up our testing and move our code to a production environment.

Run `terraform destroy` to remove all your temporary work, and see it all disappear from New Relic. Don't worry it's still in the code, so you can easily recreate it again in the future. That's the great thing about Terraform, the work you've done can now be re-used over and over.

You can find everything we used including all the references file on Github: https://github.com/kidk/futurestack2022-terraform

Thanks a lot for taking the time. If you have any feedback don't hesitate to reach out to svandamme@newrelic.com
