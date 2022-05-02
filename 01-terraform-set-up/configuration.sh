#!/usr/bin/env bash

#
# New Relic credentials
#
# Create a User API Key for your New Relic account and add it here with your account ID.
# You can find the instructions on how to do so on the New Relic docsu:
# https://docs.newrelic.com/docs/apis/intro-apis/new-relic-api-keys/
#
export NEW_RELIC_REGION="US" # or EU
export NEW_RELIC_ACCOUNT_ID=""
export NEW_RELIC_API_KEY=""

#
# Don't change this
#
export TF_VAR_NEW_RELIC_CHECK_ACCOUNT_ID="$NEW_RELIC_ACCOUNT_ID"
export TF_VAR_NEW_RELIC_ACCOUNT_ID="$NEW_RELIC_ACCOUNT_ID"

if [ -n "$NEW_RELIC_ACCOUNT_ID" ]; then
    echo "Your New Relic Account ID is $NEW_RELIC_ACCOUNT_ID"
fi
