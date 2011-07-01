" PHP DOC Settings

" Wether for PHP5 code PHP4 tags should be set, like @access,... (1|0)?
let g:pdv_cfg_php4always = 0
let g:pdv_cfg_Author = "Robert Raszczynski <raszczynski@gmail.com>"

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


