.PHONY: changelog-verify changelog-release release-help

changelog-verify:
	@./scripts/verify_changelog.sh

changelog-release:
	@if [ -z "$(VERSION)" ]; then \
		echo "ERROR: VERSION is required. Example: make changelog-release VERSION=0.1.0" >&2; \
		exit 2; \
	fi
	@./scripts/release_changelog.sh "$(VERSION)"

release-help:
	@echo "Changelog / releasing:"
	@echo "  make changelog-verify"
	@echo "  make changelog-release VERSION=0.1.0"
	@echo "Then commit, tag v0.1.0, and push the tag."


