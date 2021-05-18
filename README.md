# terraform-aws-iam

## Outline

This module encapsulates AWS IAM Terrform resources. This module will automatically create an 'admins' group and 'users' group, thus they are protected group names. You can assign IAM users to either groups. Admins have global read only access but can assume true admin through federation.

## Examples

See the `examples/complete` for example usage. 

## Testing

You can run the tests locally. You need golang and terraform cli installed. To run:

* `cd test`
* `go test`

