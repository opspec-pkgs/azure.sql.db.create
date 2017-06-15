#!/usr/bin/env sh

### begin login
loginCmd='az login -u "$loginId" -p "$loginSecret"'

# handle opts
if [ "$loginTenantId" != " " ]; then
    loginCmd=$(printf "%s --tenant %s" "$loginCmd" "$loginTenantId")
fi

case "$loginType" in
    "user")
        echo "logging in as user"
        ;;
    "sp")
        echo "logging in as service principal"
        loginCmd=$(printf "%s --service-principal" "$loginCmd")
        ;;
esac
eval "$loginCmd" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"
### end login

echo "checking for exiting sql db"
if [ "$(az sql db show --name "$name" --resource-group "$resourceGroup" --server "$server")" != "" ]
then
  echo "found exiting sql db"
else
    createCmd='az sql db create'
    createCmd=$(printf "%s --server %s" "$createCmd" "$server")
    createCmd=$(printf "%s --edition %s" "$createCmd" "$edition")
    createCmd=$(printf "%s --service-objective %s" "$createCmd" "$serviceObjective")
    createCmd=$(printf "%s --collation %s" "$createCmd" "$collation")
    createCmd=$(printf "%s --max-size %s" "$createCmd" "$maxSize")
    createCmd=$(printf "%s --name %s" "$createCmd" "$name")
    createCmd=$(printf "%s --resource-group %s" "$createCmd" "$resourceGroup")

    # handle opts
    if [ "$elasticPool" != " " ]; then
    createCmd=$(printf "%s --elastic-pool %s" "$createCmd" "$elasticPool")
    fi

    if [ "$sampleSchemaName" != " " ]; then
    createCmd=$(printf "%s --sample-name %s" "$createCmd" "$sampleSchemaName")
    fi

    if [ "$tags" != " " ]; then
        createCmd=$(printf "%s --tags %s" "$createCmd" "$tags")
    fi

    echo "creating sql db"
    eval "$createCmd"
fi
