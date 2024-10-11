.PHONY: default switch update

default: switch

switch:
	darwin-rebuild switch --flake .

update:
	nix flake update
	darwin-rebuild switch --flake .

