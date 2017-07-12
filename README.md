# vim-quotebrace

Select or yank text between all types of brackets and quotes with one key press

## Installation

### [Vundle](https://github.com/VundleVim/Vundle.vim) or similar

1. Add `Plugin 'Szero/vim-quotebrace'` to your vimrc file.
2. Reload your vimrc with `:so ~/.vimrc` or restart
3. Run `:PluginInstall`

### [dein](https://github.com/Shougo/dein.vim) (new manager from author of NeoBundle)

1. Add `call dein#add('Szero/vim-quotebrace.vim')` to your vimrc file.
2. Reload your vimrc with `:so ~/.vimrc` or restart
3. Run `:call dein#install()`

### [Pathogen](https://github.com/tpope/vim-pathogen)

```sh
cd ~/.vim/bundle
git clone https://github.com/Szero/vim-quotebrace.git
```
Reload your vimrc with `:so ~/.vimrc` or restart


## Configuration

Default keybindings are: 

 `<C-f> (Control + F)` for selecting the text between brackets
 `<C-g> (Control + G)` for yanking the text between brackets

Both keybinds work in insert and normal mode.

If you want to change the keybindings there are two variables you can add you your ~/.vimrc:

 - `let g:QuoteBraceSelect = <your keybind>`
 - `let g:QuoteBraceYank = <your keybind>`


## TODO

- Make algorithm recursive so it actually matches the brackets/quotes
- Add support for matching brackets/quotes pairs that span over multiple lines
