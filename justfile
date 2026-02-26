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
    MP_JSON="$HOME/.claude/plugins/known_marketplaces.json"; \
    yq '.marketplaces[] | [.path, (.autoUpdate // false | tostring)] | join("|")' {{CONFIG}} \
        | while IFS='|' read -r path autoUpdate; do \
            expanded=$(echo "$path" | sed "s|~|$HOME|"); \
            claude plugin marketplace add "$expanded" || true; \
            if [ "$autoUpdate" = "true" ]; then \
                name=$(basename "$expanded"); \
                jq --arg n "$name" '.[$n].autoUpdate = true' "$MP_JSON" > "$MP_JSON.tmp" && mv "$MP_JSON.tmp" "$MP_JSON"; \
            fi \
        done

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
    yq '.marketplaces[].path' {{CONFIG}} | sed "s|~|$HOME|" | xargs -I{} basename {} \
        | xargs -I{} claude plugin marketplace remove "{}" || true
