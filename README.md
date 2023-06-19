# dotfiles

Usage:
1. clone repo into any folder, say folder with path A
2. create a soft symlink from .config/nvim/ to a A/dotfiles/nvim/

```
ln -s A/dotfiles/nvim/ ~/.config/nvim/
```


LSP setup:
[clangd](https://clangd.llvm.org/installation.html) contains the installation guide for c++ lsp. At the time 
of writing, clangd-12 was installed:

```
sudo apt-get install clangd-12
```


After downloading clangd, enable it using lspconfig plugin. Sample code
```
-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.clangd.setup {}
```

Make sure to point to the latest version of clangd by creating following symlink

```
ln -s /usr/bin/clangd-12 /usr/bin/clangd
```

This way, we created an 'alias' clangd for clangd-12

