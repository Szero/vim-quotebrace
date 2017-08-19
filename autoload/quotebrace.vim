if exists('b:did_autoload_quotebrace_vim') || &cp || version < 700
    finish
endif
let b:did_autoload_quotebrace_vim = 1

function! s:IterateOverSymbols(symbol_list, cursor_position) abort
    let l:char_under_cursor = matchstr(getline('.'), '\%' . a:cursor_position . 'c.')
    for i in a:symbol_list
        if i == l:char_under_cursor
            return i
        endif
    endfor
    return ''
endfunction

function! s:MatchSymbols(mode, cur_start, l_match, r_match, quotes, l_brackets, r_brackets) abort
    let l:l_index = index(a:l_brackets + a:quotes, a:l_match)
    let l:r_index = index(a:r_brackets + a:quotes, a:r_match)
    if l:l_index >= 0 && l:r_index >= 0 && l:l_index == l:r_index
        execute 'normal! ' . a:mode . 'i' . a:l_match
        if a:mode == 'y'
            call cursor(line('.'), a:cur_start)
        endif
        return 0
    endif
    return 1
endfunction

function! s:EnterInsertOnError(editor_mode, curpos) abort
    if a:editor_mode == 'i'
        startinsert
        call cursor(line('.'), a:curpos + 1)
    endif
endfunction

function! quotebrace#QuoteBrace(mode, editor_mode) abort
    let l:cur_start = col('.')
    let l:cur_backward = l:cur_start
    let l:cur_forward = l:cur_start
    let l:line_length = col('$')
    let l:left_brackets = ["<","{","[","\("]
    let l:right_brackets = [">","}","]","\)"]
    let l:quotes = ['"',"'","`"]
    let l:left_match = ''
    let l:right_match = ''
    while 1
        if empty(l:left_match) && l:cur_backward == 0
            call s:EnterInsertOnError(a:editor_mode, l:cur_start)
            return ''
        endif
        if empty(l:right_match) && l:cur_forward == l:line_length
            call s:EnterInsertOnError(a:editor_mode, l:cur_start)
            return ''
        endif
        if empty(l:left_match)
            let left_match = s:IterateOverSymbols(
                \ l:quotes + l:left_brackets + l:right_brackets, l:cur_backward)
            let l:cur_backward -= 1
        endif
        if empty(l:right_match)
            let right_match = s:IterateOverSymbols(
                \ l:quotes + l:left_brackets + l:right_brackets, l:cur_forward)
            let l:cur_forward += 1
        endif

        if empty(s:MatchSymbols(a:mode, l:cur_start,
            \ l:left_match, l:right_match, l:quotes, l:left_brackets, l:right_brackets))
            return ''
        endif

        if !empty(l:left_match) && !empty(l:right_match)
            break
        endif
    endwhile
    let l:right_quote_brackets = l:quotes + l:right_brackets
    let l:left_quote_brackets = l:quotes + l:left_brackets
    for i in l:left_quote_brackets
        if i == l:left_match
            for j in range(l:cur_forward, l:line_length)
                let l:match = s:IterateOverSymbols(
                    \ [l:right_quote_brackets[index(l:left_quote_brackets, l:left_match)]], j)
                if empty(s:MatchSymbols(a:mode, l:cur_start,
                    \ l:left_match, l:match, l:quotes, l:left_brackets, l:right_brackets))
                    return ''
                endif
            endfor
        endif
    endfor
    for i in l:right_quote_brackets
        if i == l:right_match
            for j in range(l:cur_backward, 0, -1)
                let l:match = s:IterateOverSymbols(
                    \ [l:left_quote_brackets[index(l:right_quote_brackets, l:right_match)]], j)
                if empty(s:MatchSymbols(a:mode, l:cur_start,
                    \ l:match, l:right_match, l:quotes, l:left_brackets, l:right_brackets))
                    return ''
                endif
            endfor
        endif
    endfor
    call s:EnterInsertOnError(a:editor_mode, l:cur_start)
    return ''
endfunction
