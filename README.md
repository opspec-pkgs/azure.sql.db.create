# problem statement
creates an azure sql db (if doesn't already exist)

# example usage

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
run:
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

