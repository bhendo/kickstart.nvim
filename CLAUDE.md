# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository context

This is a personal fork of `nvim-lua/kickstart.nvim`. Two remotes exist:
- `origin` → `bhendo/kickstart.nvim` (the fork)
- `upstream` → `nvim-lua/kickstart.nvim` (kickstart's canonical repo)

**PRs ALWAYS target origin (the fork), NEVER upstream.** When using `gh pr create`, pass `--repo bhendo/kickstart.nvim` explicitly so it can't auto-select upstream.

The fork uses `vim.pack` (Neovim's built-in plugin manager), not `lazy.nvim`. Both this fork and upstream independently migrated; the migrations converged.

## Architecture

The config is split into two layers:

**`init.lua`** — kept as close to upstream as possible to minimize merge conflicts. Currently differs from `upstream/master` by 4 lines only:
- `vim.g.have_nerd_font = true`
- `vim.o.relativenumber = true`
- blink.cmp `preset = 'super-tab'`
- `require 'custom.plugins'` uncommented (the upstream-provided extension hook)

When editing `init.lua`, prefer extracting the change to a custom plugin over modifying `init.lua` directly. The first three lines above only stay in `init.lua` because `have_nerd_font` is read inline by mini.icons during init, `relativenumber`/blink preset would be slightly awkward to override post-init, and the loader line is the intended hook. New customizations should go to `lua/custom/plugins/`.

**`lua/custom/plugins/`** — all personal customizations. The loader at `lua/custom/plugins/init.lua` requires each file in a deliberate order (kickstart enables → LSP/mason extras → formatting/completion overrides → editor → language-specific → keymaps). Order matters: later files can depend on plugins set up earlier.

Each custom plugin file is self-contained and follows the same pattern as `lua/kickstart/plugins/*.lua`:
1. `vim.pack.add { ... }` to declare plugin source
2. `require('plugin').setup { ... }` (or equivalent) to configure
3. Any related keymaps/autocmds inline

`conform.setup` and other plugins that use `tbl_deep_extend` can be re-called in custom files to merge with `init.lua`'s base config (see `lua/custom/plugins/conform.lua`).

`lua/kickstart/plugins/*.lua` are kickstart's *optional* plugin enables. Adding one to the loader in `lua/custom/plugins/init.lua` opts into it without modifying `init.lua`.

## Common commands

Smoke-test the config (used to verify after merges/refactors):
```sh
nvim --headless "+lua print('config loaded ok')" "+qa"
```

Format Lua files (stylua config in `.stylua.toml`, uses 160-col width):
```sh
stylua init.lua lua/
```

Plugin management (run inside nvim):
- `:lua vim.pack.update(nil, { offline = true })` — inspect plugin state
- `:lua vim.pack.update()` — fetch updates (`:write` applies, `:quit` cancels)
- `:checkhealth` — diagnose config issues

## Working with upstream

To pull in upstream changes, create a `merge/upstream-YYYY-MM` branch off `master`, run `git merge upstream/master`, and resolve conflicts. The conflicts are typically:
- `init.lua` — keep `HEAD` on the 4 personal lines, accept upstream elsewhere
- `lua/custom/plugins/init.lua` — keep `HEAD` (our ordered loader)
- `.gitignore` — keep `HEAD` (has `.worktrees/`)
- `README.md` — usually auto-merges

After resolving, run the headless smoke-test before committing.

## Conventions

- Stylua: 160-col, single quotes, no parens on single-arg calls, collapse simple statements.
- Comments in custom plugin files explain *why* something is done a certain way (e.g., load-order dependencies, why a setup is re-called); they are not docstrings of *what* the code does.
- New custom plugins are added by creating `lua/custom/plugins/<name>.lua` and adding a `require 'custom.plugins.<name>'` line in the appropriate section of `lua/custom/plugins/init.lua`.
