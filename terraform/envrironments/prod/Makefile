.PHONY: init
init:
		terragrunt run-all init --terragrunt-non-interactive

.PHONY: plan
plan:
		terragrunt run-all plan
		
.PHONY: apply
apply:
		terragrunt run-all apply

.PHONY: destroy
destroy:
		terragrunt run-all destroy

.PHONY: fmt
fmt:
		terragrunt hclfmt && \
		terraform fmt --recursive

.PHONY: output
output:
		terragrunt run-all output
