TF_LOG := ERROR

.PHONY: tasks

tasks:
	@echo Usage: make [task]
	@echo --------------------
	@echo
	@cat Makefile
	@echo

clean:
	find . -name ".terragrunt-cache" | xargs rm -rf

init:
	terragrunt run-all init --terragrunt-log-level ${TF_LOG} --terragrunt-non-interactive

plan:
	terragrunt run-all plan --terragrunt-log-level ${TF_LOG}

apply:
	terragrunt run-all apply --terragrunt-log-level ${TF_LOG}

list:
	terragrunt run-all state list --terragrunt-log-level ${TF_LOG} --terragrunt-non-interactive

destroy:
	terragrunt run-all destroy --terragrunt-log-level ${TF_LOG}

output:
	terragrunt run-all output --terragrunt-log-level ${TF_LOG}
