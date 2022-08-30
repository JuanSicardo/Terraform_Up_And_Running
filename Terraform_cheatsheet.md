Terraform Cheatsheet
====================

Commands
--------

### Init

Creates all the necessary files to work with Terraform and downloads the
references providers. It also configures your backend.

```shell
terraform init
```

### Plan

Lets you review a plan of how Terraform intends to transform the existing
infrastructure in order to produce the desired state.

```shell
terraform plan
```

### Apply

Carries out the necessary changes to produce the desired infrastructure. Before
executing any change though, it shows you the output of `terraform apply` so you
can double-check that the changes are all intended.

```shell
terraform apply
```

### Graph

Prints a graph (in DOT language) that describes the order in which resources
will be created based on their dependencies. The output can be converted into an
image using Graphviz.

```shell
terraform graph
```

### Destroy

Destroys all the tracked resources.

```shell
terraform destroy
```

Syntax
------

### Configuration

Terraform configuration is done through the `terraform` block:

```hcl
terraform {
  backend "<BACKEND_NAME>" {
    [CONFIG...]
  }
}
```

Some useful configurations can be:
* `backend`: lets you indicate a remote backend for Terraform.

### Providers

Tells Terraform which cloud providers you are going to use and lets you
configure them.

```hcl
provider "<PROVIDER>" {
  argument1 = "value1"
  argument2 = "value2"
}
```

* The `PROVIDER` is the name of the cloud provider such as "aws", "cpg", "oci",
  etc.
* Arguments are used for configuration of the provider such as authentication or
  region selection.

### Resources

These represent units of infrastructure that you can deploy.

```hcl
resource "<PROVIDER>_<TYPE>" "<NAME>" {
  argument1 = "value1"
  argument2 = "value2"
}
```

* The `PROVIDER` is the name of the cloud provider that offers the resource.
* The `TYPE` indicates what kind of resource you want to create like a VM,
  database, load balancer, etc.
* The `NAME` is an identifier you can use to reference this resource throughout
  your code.
* Arguments are used to configure the resource you want to create.

The `lifecycle` argument is a special argument that lets you indicate Terraform
aspects of how and when a resource is created, modified or destroyed.

### References

These let you reference the value of attributes of resources.

```hcl
<PROVIDER>_<TYPE>.<NAME>.<ATTRIBUTE>
```

* The `PROVIDER` and `TYPE` identify the kind of resource you want to access.
* The `NAME` identifies the exact resource you are looking for.
* The `ATTRIBUTE` is the value you want to reference.

### Input Variables

Variables let you assign to them any value to them and then retrieve it latter.
The value of a variable can be set using the command line, using a file or
through environment variables.
To declare a value you use the following syntax:

 ```hcl
 variable "NAME" {
  description = "DESCRIPTION"
  default     = "DEFAULT"
  type        = string/number/bool/list/map/set/object/tuple/any
  validation  = "VALIDATION"
  sensitive   = true/false
}
 ```

* `description` is a description for the variable, mainly for other devs to know
  what the variable is for.
* `default` in case the values isn't found on any of the possible sources, this
  value is assigned to the variable.
* `type` is the datatype of the value. It can be `string`, `number`, `bool`
  , `list`, `map`, `set`, `object`, `tuple` or `any`. It can also be a data
  structure using `object`.
* `validation` lets you set validation parameters for the variable.
* `sensitive` is used to mark variables that store secrets. When you mark a
  variable as sensitive it will not be logged or visible.

To retreive the value of a variable you use the following syntax:

```hcl
var.<VARIABLE_NAME>
```

### Output Variables

Output variables are used to output some information to the console after
a `terraform apply` operation.

```hcl
output "<NAME>" {
  value = <VALUE>
}
```

You can add the following parameters:

* `description` is just an informative description of the variable.
* `sensitive` is used to mark secrets, this way Terraform won't log this value.
* `dependes_on` is used to indicate a dependency with a resource.

Output variables are printed after any `terraform apply` operation and then can
be retrieved through the console.

To retrieve all output variables:

```shell
terraform output
```

To retrieve one output variable in specific:

```shell
terraform output <VAR_NAME>
```

### Data Sources

A data source represents a piece of read-only information that is fetched
directly from the provider. To declare you want to use a datasource you use:

```hcl
data "<PROVIDER>_<TYPE>" "<NAME>" {
  argument1 = "value1"
  argument2 = "value2"
}
```

This returns an object with different attributes. Here arguments are commonly
filters that tell the provider which object you want to retrieve.

To retrieve the value of an attribute form a data source:

```hcl
data.<PROVIDER>_<TYPE>.<NAME>.<ATTRIBUTE>
```

### Lifecycle

In terraform you can use the parameter `lifecycle` to indicate special behaviors
for your resources related to creation, modifications and destruction.

```hcl
resource "<PROVIDER>_<TYPE>" "<NAME>" {
  argument1 = "value1"
  argument2 = "value2"

  lifecycle {
    lifecycle_argument1 = "value"
    lifecycle_argument2 = "value"
  }
}
```

Useful lifecycle arguments:

* `create_before_destroy`: when a resource need to be destroyed and recreated,
  this argument instructs Terraform to first create the new resource and then
  destroy the original.
* `prevent_destroy`: this argument instructs Terraform to prevent the
  destruction of this resource. If there is an attempt to destroy this resource,
  terraform will exit with an error.

Notes
-----

### Files to ingnore

It is recommended that you include the following files in your `.gitignore`:

```.gitignore
.terraform
*.tfstate
*.tfstate.backup
```
