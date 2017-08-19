# vim-quotebrace

Select or yank text between all types of brackets and quotes with a single key combination.

## Rationale

If we want to select or yank the text, lets say between double quotes for example, we have to
enter normal mode and type `vi"` for selection and `yi"` for yanking. If we need to perfom same
operations but on curly braces whe have to type `vi{` or `yi{`. This can become quite hideous if
our text is quotes/brackets-heavy. My plugin will detect bracket and quote pairs and select/yank
between them with single key combination either from insert or normal mode.

## Installation

### [Vundle](https://github.com/VundleVim/Vundle.vim) or similar

1. Add `Plugin 'Szero/vim-quotebrace'` to your vimrc file.
2. Reload your vimrc with `:so ~/.vimrc` or restart
3. Run `:PluginInstall`

### [dein](https://github.com/Shougo/dein.vim) (new plugin manager from the author of NeoBundle)

1. Add `call dein#add('Szero/vim-quotebrace.vim')` to your vimrc file.
2. Reload your vimrc with `:so ~/.vimrc` or restart
3. Run `:call dein#install()`

### [Pathogen](https://github.com/tpope/vim-pathogen)

```sh
cd ~/.vim/bundle
git clone https://github.com/Szero/vim-quotebrace.git
```

## Usage

### Keybindings

Default keybindings are:

`<leader>s` for selecting the text between brackets

`<leader>y` for yanking the text between brackets

Leader is special key user can bind and use it in his own keybinds.

If you don't have it bound already, I recommend binding it to `,` (comma) by adding this line to
your vimrc:

```vim
let mapleader=","
```

Each keybind works from insert and normal mode.

### Configuration

If you want to change the default keybindings, there are two variables you can add you your vimrc:

```vim
let g:QuoteBraceSelect = "your keybind"

let g:QuoteBraceYank = "your keybind"
```

## TODO

- Make algorithm recursive so it actually matches the brackets/quotes
- Add support for matching brackets/quotes pairs that span over multiple lines
