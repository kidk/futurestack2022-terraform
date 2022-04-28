# Here we configure Terraform to use the New Relic provider.
# We've already configured the right configuration for this workshop, so no changes are needed.
# When working with customers you can find the instructions for this on the Terraform registry:
# New Relic: https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/guides/provider_configuration
# If you want to work with other providers, this is where you would add them.

terraform {
    # We can define which is the minimum version of Terraform to have installed locally
    required_version = "~> 1.1"
    required_providers {
        # Here we define which version of the New Relic provider we want to use
        # This allows customers to fix to a certain version of the provider
        # giving them more control when to upgrade as some versions might contain
        # breaking changes. In general the Observability as code team tries to
        # avoid this, but it does happen. Advise your customers always to use
        # the latest version
        newrelic = {
            source  = "newrelic/newrelic"
            version = "~> 2.43.4"
        }

        # Terraform also provides some handy providers, this one we use to generate random strings
        random = {
            source  = "hashicorp/random"
            version = "~> 3.1"
        }
    }
}


# After we've downloaded the latest version of the New Relic provider, we need to
# configure it with the right API keys. Although we have the option to do it here
# directly that's considered a bad practice. Because Terraform files are usually
# added to a source control system like Git, it could mean that credentials become
# exposed to anyone that has access to that system. So we just say that we want to
# use New Relic.
provider "newrelic" {}
