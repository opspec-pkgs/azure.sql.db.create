# Problem statement
creates an azure sql db (if doesn't already exist)

# Example usage

> note: in examples, VERSION represents a version of the azure.sql.db.create pkg

## install

```shell
opctl pkg install github.com/opspec-pkgs/azure.sql.db.create#VERSION
```

## run

```
opctl run github.com/opspec-pkgs/azure.sql.db.create#VERSION
```

## compose

```yaml
op:
  pkg: { ref: github.com/opspec-pkgs/azure.sql.db.create#VERSION }
  inputs: 
    subscriptionId:
    loginId:
    loginSecret:
    name:
    server:
    resourceGroup:
    # begin optional args
    elasticPool:
    edition:
    serviceObjective:
    collation:
    maxSize:
    sampleSchemaName:
    loginTenantId:
    loginType:
    tags:
    # end optional args
```

# Support

join us on [![Slack](https://opspec-slackin.herokuapp.com/badge.svg)](https://opspec-slackin.herokuapp.com/)
or [open an issue](https://github.com/opspec-pkgs/azure.sql.db.create/issues)
