# AGENTS.md

This file provides guidance to Codex (Codex.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on [ayamir/nvimdots](https://github.com/ayamir/nvimdots), using lazy.nvim for plugin management (~100 plugins). It supports macOS, Linux, and NixOS.

## Formatting

Lua files are formatted with stylua (config in `stylua.toml`): 120 column width, tabs, Unix line endings.

## Nix

- `nix develop` — enter dev shell with Neovim
- `nix build .#testEnv` — build test environment
- `nix run .#check-linker` — check Mason binary linking

## Architecture

**Entry point:** `init.lua` → `require("core")` (skipped in VSCode)

**Load order in `lua/core/`:**
1. `global.lua` — platform detection, path globals
2. `settings.lua` — defaults merged with `user/settings.lua`
3. `options.lua` — vim options merged with `user/options.lua`
4. `event.lua` — autocommands
5. `pack.lua` — bootstraps lazy.nvim, loads plugin specs from `modules/plugins/` and `user/plugins/`
6. `keymap/init.lua` — keybindings merged with `user/keymap/`

**Plugin specs** live in `lua/modules/plugins/` organized into 5 files: `ui.lua`, `completion.lua`, `editor.lua`, `lang.lua`, `tool.lua`. Each plugin's configuration function lives in `lua/modules/configs/<category>/`.

**User override system:** Files under `lua/user/` shadow the corresponding core files. `user/settings.lua` overrides `core/settings.lua`, `user/plugins/*.lua` adds plugins, `user/keymap/*.lua` adds bindings. The `user_template/` directory shows the expected shape.

**Key subsystems:**
- LSP: mason.nvim auto-installs servers listed in `core/settings.lua` → `lsp_deps`. Server-specific configs go in `modules/configs/completion/servers/`.
- Completion: nvim-cmp with LSP, buffer, path, copilot, and snippet sources.
- AI: Copilot (via cmp), CodeCompanion (OpenRouter, key in `CODE_COMPANION_KEY` env var), and Codex.nvim.
- Formatting: none-ls.nvim + mason-null-ls. Format-on-save enabled by default; formatters listed in `settings.lua` → `null_ls_deps`.

**Leader key:** `<Space>`. Keybindings are split by category in `lua/keymap/`.
