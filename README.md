# My neovim config
Here's my neovim editor config file
Disabled Disabled Disabled Disabled, stop update
## ⚡ Requirements

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads) (_Optional with manual intervention:_ See [Documentation on customizing icons](https://docs.astronvim.com/Recipes/icons))
- [Neovim 0.8+ (_Not_ including nightly)](https://github.com/neovim/neovim/releases/tag/stable)
- [Tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md) (_Note:_ This is only necessary if you want to use `auto_install` feature with Treesitter)
- [Astronvim](https://github.com/AstroNvim/AstroNvim/tree/main)
- A clipboard tool is necessary for the integration with the system clipboard (see [`:help clipboard-tool`](https://neovim.io/doc/user/provider.html#clipboard-tool) for supported solutions)
- Terminal with true color support (for the default theme, otherwise it is dependent on the theme you are using)
- Optional Requirements:
  - [ripgrep](https://github.com/BurntSushi/ripgrep) - live grep telescope search (`<leader>fw`)
  - [lazygit](https://github.com/jesseduffield/lazygit) - git ui toggle terminal (`<leader>tl` or `<leader>gg`)
  - [go DiskUsage()](https://github.com/dundee/gdu) - disk usage toggle terminal (`<leader>tu`)
  - [bottom](https://github.com/ClementTsang/bottom) - process viewer toggle terminal (`<leader>tt`)
  - [Python](https://www.python.org/) - python repl toggle terminal (`<leader>tp`)
  - [Node](https://nodejs.org/en/) - node repl toggle terminal (`<leader>tn`)


## ⭐ Problems that may be encountered in use
1. Markdown preview display issue
   If you confirm that there is no problem with node, it may be a markdown plugin automatic
   download configuration error, I don't know if this is an issue with Astronvim or a problem 
   with the markdown plugin, in my four notebooks, three have such a problem.  
   Use `node --version` to determine if node is installed
   ```shell
   cd ~/.local/share/nvim/lazy/
   rm -rf markdown-preview.nvim
   git clone https://github.com/iamcco/markdown-preview.nvim.git
   cd markdown-preview.nvim
   npx --yes yarn install
   npx --yes yarn build
   ```

---

> **Author:** NichloasChiu  
> **Date of creation:** 2024-03-21  
> **Contact information:** [Email](mailto:NichloasChiu@outlook.com)

---
