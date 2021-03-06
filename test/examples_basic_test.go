package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestExamplesBasic(t *testing.T) {

	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/cloudwatch_log_group",
		Vars: map[string]interface{}{
			"name":     "test-enable-logs",
		},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}
