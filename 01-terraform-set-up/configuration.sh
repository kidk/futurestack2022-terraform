#!/usr/bin/env bash

#
# New Relic credentials
#
# Create a User API Key (NEW_RELIC_API_KEY) for your New Relic account
# and add it here with your account ID (NEW_RELIC_ACCOUNT_ID).
# Double check you have the right region by looking at the url of your
# browser when you're in New Relic. EU accounts will show `eu` at the beginning of the url.
# You can find the instructions on how to do so on the New Relic docs:
# https://docs.newrelic.com/docs/apis/intro-apis/new-relic-api-keys/
#
export NEW_RELIC_REGION="US" # or EU
export NEW_RELIC_ACCOUNT_ID=""
export NEW_RELIC_API_KEY=""

#
# Don't change these, you only need to change the variables above
#
export TF_VAR_NEW_RELIC_CHECK_ACCOUNT_ID="$NEW_RELIC_ACCOUNT_ID"
export TF_VAR_NEW_RELIC_ACCOUNT_ID="$NEW_RELIC_ACCOUNT_ID"

if [ -n "$NEW_RELIC_ACCOUNT_ID" ]; then
    echo "Your New Relic Account ID is $NEW_RELIC_ACCOUNT_ID"
else
    echo "No account ID was set, please check your configuration."
fi
