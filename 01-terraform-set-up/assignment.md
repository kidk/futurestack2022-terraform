---
slug: terraform-set-up
id: 8ueltqfbuios
type: challenge
title: Setting up Terraform with New Relic
teaser: Learn how to create directory
notes:
- type: text
  contents: Please wait while we set up the first challenge
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

Setting up Terraform
==============

Welcome to the hands on workshop for New Relic and Terraform. We will guide you in creating you first Terraform resources. During this workshop you will learn to create alerts, synthetic checks, dashboards and SLI's all automated and generated through Terraform. If you're new to Terraform you will learn some key concepts you will be able to use with other providers.

To complete this workshop you will need a New Relic account, if you don't have on already you can create it on https://newrelic.com/signup

The first step in using Terraform is setting up the providers with the right credentials. Open `providers.tf` in the local editor (Tab in top left of your screen) and review the contents of the file to understand how providers in Terraform work, and how you can configure Terraform to use them.

![Editor pane](https://raw.githubusercontent.com/kidk/futurestack2022-terraform/main/01-terraform-set-up/editor.png)

When using the editor it could be that keyboard shortcuts like `CMD + S` or `CTRL + S` don't work, you can always click the save icon next to the filename to save your file.

![Save icon](https://raw.githubusercontent.com/kidk/futurestack2022-terraform/main/01-terraform-set-up/save.png)

Once you're done with `providers.tf`, open the `configuration.sh` file and follow the instructions to generate API key credentials for allowing Terraform to communicate with the New Relic API.

After changing your credentials in `configuration.sh`, go back to the shell using tabs on top of the screen and run the following commands to validate your configuration. If you get any errors, double check the configuration.sh file.

1) Load your credentials into the environment: `source ./configuration.sh`
2) Initiate Terraform to download the latest version of the providers: `terraform init`
3) Test your credentials and see if everything is configured correctly: `terraform plan`

Once you're done you can click on 'Check' (bottom right of your screen) to continue.
