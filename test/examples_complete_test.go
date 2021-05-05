package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/files"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

// An example of how to test the simple Terraform module in examples/terraform-basic-example using Terratest.
func TestTerraformBasicExample(t *testing.T) {
	t.Parallel()

	defer os.Remove("../test-provider.tf")
	files.CopyFile("provider.tf", "../test-provider.tf")

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "..",

		// // Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"./test/test.auto.tfvars.json"},

		// Disable colors in Terraform commands so its easier to parse stdout/stderr
		NoColor: true,
	})

	// website::tag::4::Clean up resources with "terraform destroy". Using "defer" runs the command at the end of the test, whether the test succeeds or fails.
	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// website::tag::2::Run "terraform init" and "terraform apply".
	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// // Run `terraform output` to get the values of output variables
	actualTextExample := terraform.Output(t, terraformOptions, "groups")
	// actualTextExample2 := terraform.Output(t, terraformOptions, "example2")
	// actualExampleList := terraform.OutputList(t, terraformOptions, "example_list")
	// actualExampleMap := terraform.OutputMap(t, terraformOptions, "example_map")
	fmt.Println(actualTextExample)
	// // website::tag::3::Check the output against expected values.
	// // Verify we're getting back the outputs we expect
	// assert.Equal(t, expectedText, actualTextExample)
	// assert.Equal(t, expectedText, actualTextExample2)
	// assert.Equal(t, expectedList, actualExampleList)
	// assert.Equal(t, expectedMap, actualExampleMap)
}
