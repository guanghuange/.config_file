scriptencoding utf-8
" Set Plugin Manager
" default:  <vim-plug>  use vim-plug
"           <dein>      use dein(in plan)
let g:plugin_manager = 'vim-plug'

" 语言加载设置
"
" Markdown
" default:  <1> enable support markdown
"           <0> disable support markdown
let g:language_markdown_enable = 1

" Shell
" default:  <1> enable support shell
"           <0> disable support shell
let g:language_shell_enable = 1

" Vimscript
" default:  <1> enable support vimscript
"           <0> disable support vimscript
let g:language_vim_enable = 1

" Python
" default:  <1> enable support python
"           <0> disable support python
let g:language_python_enable = 1

" Go
" default:  <1> enable support go
"           <0> disable support go
let g:language_go_enable = 1

" HTML & CSS
" default:  <1> enable support html && css
"           <0> disable support html && css
let g:language_html_enable = 1

" Javascript
" default:  <1> enable support javascript
"           <0> disable support javascript
let g:language_javascript_enable = 1

" Vue
" default:  <1> enable support vue
"           <0> disable support vue
let g:language_vue_enable = 1

" ale
" default:  <1> enable ale
"           <0> disable ale
let g:ale_enable = 1
" ale fixer
" default:  <1> enable
"           <0> disable
let g:ale_python_isort = 1
let g:ale_python_yapf = 1
let g:ale_python_autopep8 = 1
let g:ale_go_import = 1
let g:ale_go_fmt = 1
let g:ale_javascript_eslint = 1
let g:ale_javascript_import_js = 1
let g:ale_javascript_prettier = 1
let g:ale_vue_eslint = 1


" python2 path
" let g:_python2_path = '/path/to/python2'
" default: use python2 install by brew
let g:_python2_path = '/usr/local/bin/python'

" python3 path
" let g:_python3_path = '/path/to/python3'
" default: use python3 install by brew
let g:_python3_path = '/usr/local/bin/python3'

" 自动补全框架
" default:  <ncm2>      ncm2 framework
"           <deoplete>  deoplete framework
let g:complete_framework = 'ncm2'