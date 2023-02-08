# Slydragonn's dotfiles

![neovim setuo](./images/neovim.png)

## Configs

- Neovim
- Powershell

## ⚙ Requirements

- **Neovim:**

  - Neovim >= v0.8.1
  - [Nerd Fonts](https://www.nerdfonts.com/font-downloads)
  - Have [Packer](https://github.com/wbthomason/packer.nvim) installed.
  - NodeJS for TypeScript Language Server

- **Powershell**:
  - [Oh My Posh](https://ohmyposh.dev/docs/installation/windows)

## ✨ Features

- **Neovim:**
  - [packer](https://github.com/wbthomason/packer.nvim): Plugin Manager.
  - [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim): File explorer.
  - [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons): Icons for Neovim.
  - [kanagawa](https://github.com/rebelot/kanagawa.nvim): Color scheme.
  - [lualine](https://github.com/nvim-lualine/lualine.nvim): Statusline
  - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Treesitter configurations and abstraction layer.
  - [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag): Auto close and auto rename html tag.
  - [telescope](https://github.com/nvim-telescope/telescope.nvim): Highly extendable fuzzy finder over lists.
  - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Quickstart configs for Nvim LSP
  - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp): A completion plugin for neovim coded in Lua.
  - [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim): LSP diagnostics, code actions, and more via Lua.
  - [mason](https://github.com/williamboman/mason.nvim): Portable package manager.
  - [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua): Color highlighter.
  - [toggleterm](https://github.com/akinsho/toggleterm.nvim): Manage multiple terminal windows.
  - [gitsignd](https://github.com/lewis6991/gitsigns.nvim): Git integration for buffers.
  - [markdown-preview](https://github.com/iamcco/markdown-preview.nvim): Markdown preview plugin.
  - [nvim-autopairs](https://github.com/windwp/nvim-autopairs): Powerful autopair plugin.

## 🚀 Installation

Clone the repository.

```bash
git clone https://github.com/slydragonn/dotfiles
```

Move nvim directory from `/dotfiles/.config/` to

> **Windows**: `$env:LOCALAPPDATA\nvim\`

> **Linux**: `~/.config/nvim`

and run the command:

```bash
nvim +PackerSync
```

or in Neovim Editor:

```bash
:PackerSync
```
