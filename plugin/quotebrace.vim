if exists('b:did_plugin_quotebrace_vim') || &cp || version < 700
    finish
endif

let b:did_plugin_quotebrace_vim = 1

if !exists('g:QuoteBraceSelect')
    let g:QuoteBraceSelect = "<leader>s"
endif

if !exists('g:QuoteBraceSelectAll')
    let g:QuoteBraceSelectAll = "<leader>x"
endif

if !exists('g:QuoteBraceYank')
    let g:QuoteBraceYank = "<leader>y"
endif

if !exists('g:QuoteBraceYankAll')
    let g:QuoteBraceYankAll = "<leader>h"
endif

execute "inoremap <silent> <Plug>QuoteBraceSelectInsert \<ESC>:call quotebrace#QuoteBrace('vi','i')\<CR>"
execute "inoremap <silent> <Plug>QuoteBraceSelectAllInsert \<ESC>:call quotebrace#QuoteBrace('va','i')\<CR>"
execute "inoremap <silent> <Plug>QuoteBraceYankInsert \<ESC>:call quotebrace#QuoteBrace('yi','i')\<CR>"
execute "inoremap <silent> <Plug>QuoteBraceYankAllInsert \<ESC>:call quotebrace#QuoteBrace('ya','i')\<CR>"
execute "nnoremap <silent> <Plug>QuoteBraceSelectNormal :call quotebrace#QuoteBrace('vi','n')\<CR>"
execute "nnoremap <silent> <Plug>QuoteBraceSelectAllNormal :call quotebrace#QuoteBrace('va','n')\<CR>"
execute "nnoremap <silent> <Plug>QuoteBraceYankNormal :call quotebrace#QuoteBrace('yi','n')\<CR>"
execute "nnoremap <silent> <Plug>QuoteBraceYankAllNormal :call quotebrace#QuoteBrace('ya','n')\<CR>"
execute "imap " . g:QuoteBraceYank . " <Plug>QuoteBraceYankInsert"
execute "imap " . g:QuoteBraceYankAll . " <Plug>QuoteBraceYankAllInsert"
execute "nmap " . g:QuoteBraceYank . " <Plug>QuoteBraceYankNormal"
execute "nmap " . g:QuoteBraceYankAll . " <Plug>QuoteBraceYankAllNormal"
execute "imap " . g:QuoteBraceSelect ." <Plug>QuoteBraceSelectInsert"
execute "imap " . g:QuoteBraceSelectAll ." <Plug>QuoteBraceSelectAllInsert"
execute "nmap " . g:QuoteBraceSelect ." <Plug>QuoteBraceSelectNormal"
execute "nmap " . g:QuoteBraceSelectAll ." <Plug>QuoteBraceSelectAllNormal"
