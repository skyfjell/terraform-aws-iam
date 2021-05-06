package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestExamplesComplete(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/complete",
		NoColor:      true,
	})

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	// actualTextExample := terraform.Output(t, terraformOptions, "groups")
	// fmt.Println(actualTextExample)

}

// func TestNoAdminGroup(t *testing.T) {

// 	groups := []map[string]string{
// 		{"name": "admins"},
// 	}

// 	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
// 		TerraformDir: "../examples/complete",
// 		Vars: map[string]interface{}{
// 			"groups": groups,
// 			"labels": map[string]string{"test": "case"},
// 		},
// 		NoColor: true,
// 	})

// 	defer terraform.Destroy(t, terraformOptions)
// 	terraform.Init(t, terraformOptions)
// 	s, err := terraform.PlanE(t, terraformOptions)
// 	if err != nil {
// 		fmt.Println("VALIDATION ERROR")
// 		fmt.Println(s)
// 		fmt.Println(err)
// 	}

// // // Run `terraform output` to get the values of output variables
// // actualTextExample2 := terraform.Output(t, terraformOptions, "example2")
// // actualExampleList := terraform.OutputList(t, terraformOptions, "example_list")
// // actualExampleMap := terraform.OutputMap(t, terraformOptions, "example_map")
// fmt.Println(actualTextExample)
// // // website::tag::3::Check the output against expected values.
// // // Verify we're getting back the outputs we expect
// // assert.Equal(t, expectedText, actualTextExample)
// // assert.Equal(t, expectedText, actualTextExample2)
// // assert.Equal(t, expectedList, actualExampleList)
// // assert.Equal(t, expectedMap, actualExampleMap)
// }
