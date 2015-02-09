# There Be Wizards In Here!

My current vim setup.

Inspired by [gtanner's vim config](https://github.com/gtanner/tinyhippos.vimrc).
Uses [Pathogen](https://github.com/tpope/vim-pathogen).
See [Bundles](https://github.com/brentlintner/vim-settings/tree/master/.vim/bundle).

## Requirements

* Vim
* Git
* NodeJS/NPM
* Ack

## Installation

```bash
 # clone the repo into a local directory of your choice (e.g. ~/Projects on my system)
 cd [your_projects_folder]
 git clone git://github.com/fourq/vim-settings.git
 ln -s [your_projects_folder]/vim-settings/.vimrc
 ln -s [your_projects_folder]/vim-settings/.vim
 cd [your_projects_folder]/vim-settings
 ./configure
```

## Common Commands

`space`

Search.

`jj`

Escape insert mode.

`\s,\S`

Toggle spell check.

`ctrl-p`

Runs :CtrlPMixed.

`ctrl-n`

Runs :CtrlPBuffer.

`ctrl-e+f`

Runs :NerdTreeToggle.

`ctrl-h,j,k,l`

Move around windows.

`ctrl-V`

Paste from clipboard.

`Ack WORD`

Search and display entries.

## Syntastic

The `configure` script handles installing some packages.

However, be sure to install them:

https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers

## Ack Plugin

Install via: http://beyondgrep.com/install

You might also need to:

    alias ack="ack-grep"

In your `.bashrc`.

## Adding Custom Commands Per Directory

If you have a `.vim.custom` file in the CWD, it will be evaluated (last).

## Other References

* http://yavin4.anshul.info/2006/05/18/spell-check-in-vim-7/
* http://vim.cybermirror.org/runtime/vimrc_example.vim
* http://vim.cybermirror.org/runtime/mswin.vim
* http://amix.dk/vim/vimrc.html
* http://www.fprintf.net/vimCheatSheet.html
* http://vim.wikia.com/wiki/Vim_Tips_Wiki
