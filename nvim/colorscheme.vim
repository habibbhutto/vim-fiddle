let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

lua require'colorizer'.setup()

function! OnColorSchemeChange()
  " let themeStyle = system("gsettings get org.gnome.desktop.interface color-scheme") 
  " let color = g:colors_name

  " if themeStyle =~ 'dark' 
  "   set bg=dark
  "   " the color of Gnome top panel 
  "   " hi! Normal guibg=#131313
  "   if color =~ "quiet" || color =~ "lunaperche"
  "     " hi! StatusLine guibg=#181818 guifg=fg gui=bold cterm=bold
  "     " hi! StatusLineNC guibg=#101010 guifg=fg gui=NONE cterm=NONE
  "   endif
  " else
  "   set bg=light
  "   if color =~ "quiet" || color =~ "lunaperche"
  "     " hi! StatusLine guibg=#eeeeee guifg=fg gui=bold cterm=bold
  "     " hi! StatusLineNC guibg=#eeeeee guifg=fg gui=NONE cterm=NONE
  "   endif


  "   if color =~ "blue"
  "     " hi! Normal guifg=#ffffff
  "   endif
  " endif 

  hi! VertSplit guibg=bg guifg=bg ctermbg=NONE ctermfg=NONE
  hi! EndOfBuffer guibg=bg guifg=bg ctermbg=NONE ctermfg=NONE
  " let &fillchars = 'vert:│,eob: '
  highlight SignColumn guibg=bg ctermbg=NONE
  highlight LineNr guibg=bg ctermbg=NONE

  " highlight CursorLineNr guibg=bg ctermbg=NONE

  highlight Constant gui=none
  highlight Comment gui=none
  highlight Number gui=none

  hi! FloatBorder guifg=fg guibg=none
  hi! NvimTreeNormalFloat guibg=bg
  hi! TabLineFill guibg=bg gui=none
  hi! TabLine gui=none guibg=bg guifg=fg 
  hi! TabLineSel gui=bold guibg=fg guifg=bg 

  hi! NvimTreeSpecialFile guifg=fg gui=bold
  hi! NvimTreeExecFile guifg=fg gui=bold

  " if &background ==# 'dark'
  "   hi! Normal guibg=#202020
  "   hi! LineNr guibg=#202020
  "   hi! TabLineSel guibg=#202020 guifg=fg
  " endif

  highlight GitGutterAdd    guifg=#008800 ctermfg=2
  highlight GitGutterChange guifg=#0077ff ctermfg=3
  highlight GitGutterDelete guifg=#dd000a ctermfg=1

" hi! Normal guibg=transparent
" hi! NormalNC guibg=transparent
" hi! NormalFloat guibg=transparent
endfunction

autocmd! ColorScheme * call OnColorSchemeChange()

let g:gruvbox_material_foreground='material'
let g:gruvbox_material_background='medium'
let g:gruvbox_material_better_performance=1
let g:gruvbox_material_disable_italic_comment=1
let g:gruvbox_material_transparent_background=0

colorscheme gruvbox-material
call OnColorSchemeChange()

" DISABLE CUSTOM COLOR MARKERS
" hi! Comment guifg=#707070 gui=none
" hi! Keyword guifg=#0066CC gui=bold
" hi! Type guifg=#0066CC gui=bold
" hi! Statement gui=bold
" hi! Conditional gui=none
" hi! Repeat gui=none

" neovide 
let g:neovide_theme = 'auto'
let g:neovide_scale_factor=1.1

let g:neovide_cursor_trail_size = 0.2
let g:neovide_cursor_animation_length = 0.10
let g:neovide_cursor_vfx_mode = ""

let g:neovide_padding_top = 0
let g:neovide_padding_bottom = 0
let g:neovide_padding_right = 0
let g:neovide_padding_left = 0

nmap <silent> <C-=> :let neovide_scale_factor=neovide_scale_factor+0.1<CR>
nmap <silent> <C--> :let neovide_scale_factor=neovide_scale_factor-0.1<CR>
nmap <silent> <C-0> :let neovide_scale_factor=1<CR>

" TODO: Follow system color scheme dark/light
" The idea is to get the color scheme info into an env variable
" then use that env variable in vim script to load dark/light profile
" [[ `gsettings get org.gnome.desktop.interface color-scheme` =~ 'dark' ]] 
" && echo dark mode active || echo dark mode inactive

" hi! Structure guifg=#00AACC #0088DD #0077BB gui=bold
" hi! Statement guifg=#0077BB gui=none
" hi! Type guifg=#0077BB gui=none
" hi! Structure guifg=#0077BB gui=none
" hi! PreProc guifg=#0077BB gui=none
" hi! Constant guifg=#202020 gui=bold
" hi! Comment guifg=#777777 gui=none
"
" hi! Normal guibg=#FFFFFF
" hi! Normal guibg=#FFFFFF
" hi! Type guifg=#0066CC gui=bold
" hi! Statement gui=bold
" hi! Conditional gui=none
" hi! Repeat gui=none
