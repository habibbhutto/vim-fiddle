let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

lua require'colorizer'.setup()

function! OnColorSchemeChange()
  hi! VertSplit guibg=bg guifg=bg ctermbg=NONE ctermfg=NONE
  hi! EndOfBuffer guibg=bg guifg=bg ctermbg=NONE ctermfg=NONE
  " let &fillchars = 'vert:│,eob: '
  highlight SignColumn guibg=bg ctermbg=NONE
  highlight LineNr guibg=bg ctermbg=NONE
  highlight CursorLineNr guibg=bg ctermbg=NONE
  highlight Constant gui=none
  highlight Comment gui=none
  highlight Number gui=none
endfunction

autocmd ColorScheme * call OnColorSchemeChange()

let g:gruvbox_material_foreground='mix'
let g:gruvbox_material_background='medium'
let g:gruvbox_material_better_performance=1
let g:gruvbox_material_disable_italic_comment=1
let g:gruvbox_material_transparent_background=0

set bg=dark
colorscheme zenwritten
call OnColorSchemeChange()

