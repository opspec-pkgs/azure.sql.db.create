#!/usr/bin/env sh

echo "logging in to azure"
az login -u "$azureUsername" -p "$azurePassword" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"

echo "checking for exiting sql db"
if [ "$(az sql db show --name "$name" --resource-group "$resourceGroup" --server "$server")" != "" ]
then
  echo "found exiting sql db"
else
  echo "creating sql db"
  az sql db create \
    --server "$server" \
    --elastic-pool "$elasticPool" \
    --edition "$edition" \
    --service-objective "$serviceObjective" \
    --collation "$collation" \
    --max-size "$maxSize" \
    --name "$name" \
    --resource-group "$resourceGroup"
fi
