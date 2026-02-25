default: help

# Affiche la liste des recettes disponibles
help:
    @just --list

CONFIG := "cc-plugins.yaml"

# Applique la configuration nix-darwin
switch:
    sudo darwin-rebuild switch --flake .#omicron

# Met à jour les inputs du flake puis applique
update:
    nix flake update
    sudo darwin-rebuild switch --flake .#omicron

# Enregistre les marketplaces Claude Code
cc-marketplaces:
    yq '.marketplaces[]' {{CONFIG}} | sed "s|~|$HOME|" | xargs -I{} claude plugin marketplace add "{}" || true

# Installe tous les plugins
cc-install: cc-marketplaces
    yq '.installations[] | . as $i | .plugins[] | [$i.scope, ($i.folder // ""), .] | join("|")' {{CONFIG}} \
        | while IFS='|' read -r scope vault plugin; do \
            if [ -n "$vault" ]; then \
                dir=$(echo "$vault" | sed "s|~|$HOME|"); \
                cd "$dir" && claude plugin install "$plugin" --scope "$scope"; \
            else \
                claude plugin install "$plugin" --scope "$scope"; \
            fi \
        done

# Désinstalle tous les plugins et marketplaces
cc-uninstall:
    yq '.installations[] | . as $i | .plugins[] | [$i.scope, ($i.folder // ""), .] | join("|")' {{CONFIG}} \
        | while IFS='|' read -r scope vault plugin; do \
            name="${plugin%%@*}"; \
            if [ -n "$vault" ]; then \
                dir=$(echo "$vault" | sed "s|~|$HOME|"); \
                cd "$dir" && claude plugin uninstall "$name" --scope "$scope" || true; \
            else \
                claude plugin uninstall "$name" --scope "$scope" || true; \
            fi \
        done
    yq '.marketplaces[]' {{CONFIG}} | sed "s|~|$HOME|" | xargs -I{} basename {} \
        | xargs -I{} claude plugin marketplace remove "{}" || true
