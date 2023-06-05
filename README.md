# My Own Neovim config (Now using Lua 🤯)

<p align="center">
   <a href="https://github.com/yoquec/nvim/stargazers"><img src="https://img.shields.io/github/stars/yoquec/nvim?colorA=363a4f&colorB=b7bdf8&style=for-the-badge"></a>
  <a href="https://github.com/Yoquec/nvim/commits/main"><img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/yoquec/nvim?color=98c379&style=for-the-badge"></a>
  <img alt="Neovim Version" src="https://img.shields.io/badge/NEOVIM-> v0.8.0-E5C07B?style=for-the-badge&logo=neovim">
</p>

This is my personal neovim config that I use in a day-to-day basis.
The aim of this repo is to be able to take my config files wherever I want and maybe inspire others to build their own configs.

## Showcase 🤩

![Showcase of my config](https://i.imgur.com/A2gxVLq.png "My nvim config showcase")

## Installation 🧰
>It is important to note that the config <mark>only works on UNIX-base systems</mark> and on <mark>neovim</mark> because of the folder structure.

After installing the required dependencies (listed down below), go inside ⚙ `XDG_CONFIG_HOME` (most probably your `$HOME/.config` directory). Once inside you just have to clone the repo using: 
```bash
git clone https://github.com/Yoquec/nvim.git
```

After installing [packer.nvim](https://github.com/wbthomason/packer.nvim), just enter Neovim and type

```vimL
:PackerSync
```

Restart neovim, and you will be good to go! 🎉


## Dependencies 🏗
- neovim > 0.8
- [packer.nvim](https://github.com/wbthomason/packer.nvim)
- a [patched font](https://nerdfonts.com)

