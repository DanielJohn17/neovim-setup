# Neovim Setup

This is my neovim setup.

## Features

My neovim setup includes the following features:

- Lazy loading of plugins
- Auto completion
- Linting
- Formatting
- Git integration
- Fuzzy file finding
- Fuzzy buffer finding

## Prerequisites

Before you install my neovim setup, you need to make sure that you have the following prerequisites installed:

- [Neovim](https://neovim.io/)
- [Python](https://www.python.org/)
- [Node.js](https://nodejs.org/)
- [Npm](https://www.npmjs.com/)
- [lazygit](https://github.com/jesseduffield/lazygit)

`python-venv` is also required to install the python packages. You can install it using the following command:

```bash
sudo apt-get install python3-venv
```

## Installation

To install my neovim setup, you need to follow these steps:

```bash
git clone https://github.com/DanielJohn17/neovim-setup.git ~/.config/nvim
nvim .
```

Once you have opened neovim, you need to run the following command to install the different lsp servers or lazy load the plugins:

```bash
:Mason # This will install the different lsp servers
:Lazy # This will show the lazy loading plugins
```

## Uninstallation

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```
