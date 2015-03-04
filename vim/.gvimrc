" setting solarized {{{
let g:solarized_contrast = 'normal' " 'normal' 'high' or 'low'
let g:solarized_visibility= 'low' " 'normal' 'high' or 'low'

set background=dark
colorscheme solarized
" }}}

" resetting gitgutter column bg{{{
highlight clear SignColumn
highlight   GitGutterAdd             guibg='#002b36'   guifg='green'
highlight   GitGutterChange          guibg='#002b36'   guifg='yellow'
highlight   GitGutterDelete          guibg='#002b36'   guifg='red'
highlight   GitGutterChangeDelete    guibg='#002b36'   guifg='red'
" }}}

call togglebg#map("<F5>")
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
set guioptions=c
set guiheadroom=0
