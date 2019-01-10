setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal autoindent
setlocal smarttab
" love vim so much
nnoremap <LocalLeader>m :w<CR> :!make && mimeopen "%:r.pdf"&<CR><CR>
nnoremap <LocalLeader>r :w<CR> :!make<CR><CR>
