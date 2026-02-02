.PHONY: default switch update

.DEFAULT := switch

switch:
	sudo darwin-rebuild switch --flake .#omicron

update:
	nix flake update
	sudo darwin-rebuild switch --flake .#omicron

