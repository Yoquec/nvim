# My Own Neovim config (Now using Lua 🤯)
This is my personal neovim config that I use in a day-to-day basis.
The aim of this repo is to be able to take my config files wherever I want and maybe inspire others to build their own configs.


## Installation 🧰
>It is important to note that the config <mark>only works on UNIX-base systems</mark> and on <mark>neovim</mark> because of the folder structure.

Go inside ⚙ `XDG_CONFIG_HOME` (most probably your `$HOME/.config` directory), you just have to clone the repo using: 
```bash
git clone https://github.com/Yoquec/nvim.git
```
to get all the config files.


After installing [packer.nvim](https://github.com/wbthomason/packer.nvim), just enter Neovim and type

```vimL
:PackerSync
```

Restart neovim, and you will be good to go! 🎉


## Dependencies 🏗
- neovim > 0.5
- [packer.nvim](https://github.com/wbthomason/packer.nvim)
- a [patched font](nerdfonts.com)

