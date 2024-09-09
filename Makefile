PLAYBOOK_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

define run-ansible
	ansible-playbook $(1).yaml
endef

.PHONY: bat
bat:
	$(call run-ansible)

# This nifty trick is from https://github.com/paulRbr/ansible-makefile/blob/master/Makefile
help:
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-42s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
