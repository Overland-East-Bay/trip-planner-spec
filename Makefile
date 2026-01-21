.PHONY: help ci openapi-validate openapi-validate-all changelog-verify changelog-release release-help

OPENAPI_SPEC ?= openapi/openapi.yaml
OPENAPI_SPECS ?= openapi/openapi.yaml openapi/web-bff.yaml

help:
	@echo "CI / verification:"
	@echo "  make ci"
	@echo "  make openapi-validate"
	@echo ""
	@echo "Changelog / releasing:"
	@echo "  make changelog-verify"
	@echo "  make changelog-release VERSION=0.1.0"
	@echo "Then commit, tag v0.1.0, and push the tag."

ci: changelog-verify openapi-validate-all

openapi-validate:
	@./scripts/validate_openapi.sh "$(OPENAPI_SPEC)"

openapi-validate-all: ## Validate all OpenAPI specs in this repo
	@for f in $(OPENAPI_SPECS); do \
		echo "Validating $$f"; \
		./scripts/validate_openapi.sh "$$f"; \
	done

changelog-verify:
	@./scripts/verify_changelog.sh

changelog-release:
	@if [ -z "$(VERSION)" ]; then \
		echo "ERROR: VERSION is required. Example: make changelog-release VERSION=0.1.0" >&2; \
		exit 2; \
	fi
	@./scripts/release_changelog.sh "$(VERSION)"

release-help:
	@$(MAKE) help


