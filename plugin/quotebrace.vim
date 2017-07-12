if exists('b:did_plugin_quotebrace_vim') || &cp || version < 700
    finish
endif

let b:did_plugin_quotebrace_vim = 1

if !exists('g:QuoteBraceSelect')
    let g:QuoteBraceSelect = "<C-f>"
endif

if !exists('g:QuoteBraceYank')
    let g:QuoteBraceYank = "<C-g>"
endif

"command! QuoteBraceSelect call quotebrace#QuoteBrace('v')
"command! QuoteBraceYank call quotebrace#QuoteBrace('y')

"inoremap <silent><C-f> <esc> :QuoteBraceSelect<CR>i
"nnoremap <silent><C-f> :QuoteBraceSelect<CR>
"inoremap <silent><C-g> <esc> :QuoteBraceYank<CR>i
"nnoremap <silent><C-g> :QuoteBraceYank<CR>
"
execute "inoremap <silent> <Plug>QuoteBraceSelectInsert \<ESC>:call quotebrace#QuoteBrace('v','i')\<CR>"
execute "inoremap <silent> <Plug>QuoteBraceYankInsert \<ESC>:call quotebrace#QuoteBrace('y','i')\<CR>"
execute "nnoremap <silent> <Plug>QuoteBraceSelectNormal :call quotebrace#QuoteBrace('v','n')\<CR>"
execute "nnoremap <silent> <Plug>QuoteBraceYankNormal :call quotebrace#QuoteBrace('y','n')\<CR>"
execute "imap " . g:QuoteBraceYank ." <Plug>QuoteBraceYankInsert"
execute "nmap " . g:QuoteBraceYank ." <Plug>QuoteBraceYankNormal"
execute "imap " . g:QuoteBraceSelect ." <Plug>QuoteBraceSelectInsert"
execute "nmap " . g:QuoteBraceSelect ." <Plug>QuoteBraceSelectNormal"
