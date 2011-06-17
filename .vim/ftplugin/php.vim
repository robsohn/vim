" PHP Settings

inoremap <C-P><ESC> :call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

let php_sql_query=1
let php_htmlInStrings=1
let php_parent_error_close=1
let php_parent_error_open=1
let php_folding = 0

" Set up automatic formatting
set formatoptions+=tcqlro

autocmd BufNewFile,BufRead *.phtml set ft=php
