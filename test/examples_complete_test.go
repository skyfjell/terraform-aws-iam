package test

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestExamplesComplete(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/complete",
		NoColor:      true,
	})

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	admin_users := terraform.OutputList(t, terraformOptions, "admin-users")
	assert.Equal(t, 1, len(admin_users))
	assert.Equal(t, true, strings.Contains(admin_users[0], "betty.white"))

	groups := terraform.OutputMapOfObjects(t, terraformOptions, "groups")

	ext_group := groups["external"].(map[string]string)
	assert.Equal(t, ext_group["name"], "test-external")

}
