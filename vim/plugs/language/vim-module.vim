scriptencoding utf-8
" Vim
"
" ---> 修改不同类型文件的设置
augroup file_set
  autocmd FileType vim
        \ setlocal fileformat=unix |
        \ setlocal tabstop=2 |
        \ setlocal softtabstop=2 |
        \ setlocal shiftwidth=2 |
augroup end

if g:ncm2_framework_enable
  Plug 'ncm2/ncm2-vim', {'for': 'vim'}
endif
Plug 'Shougo/neco-vim', {'for': 'vim'}
