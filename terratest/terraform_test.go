package test

import (
	"fmt"
	"github.com/gruntwork-io/terratest/modules/random"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the simple Terraform module in examples/terraform-basic-example using Terratest.
// Make sure you have the dep binary, https://github.com/golang/dep
// Run 'dep ensure' before run test cases.

func TestTerraformBasicExampleNew(t *testing.T) {
	t.Parallel()

	kafkaInstanceName := fmt.Sprintf("tf-test-%d", random.Random(100, 1000))

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../example/",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"kafka_instance_name": kafkaInstanceName,
			// We also can see how lists and maps translate between terratest and terraform.
		},

		// Disable colors in Terraform commands, so it's easier to parse stdout/stderr
		NoColor: true,
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the values of output variables
	thisKafkaInstanceName := terraform.Output(t, terraformOptions, "this_kafka_instance_name")

	// Verify we're getting back the outputs we expect
	assert.Equal(t, thisKafkaInstanceName, kafkaInstanceName)
}
