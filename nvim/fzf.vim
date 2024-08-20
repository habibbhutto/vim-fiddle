" Configuration for FZF
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 1.0, 'relative': v:false, 'yoffset': -1.0 } }
" let g:fzf_preview_window = []
let g:fzf_preview_window = ['down:75%', 'ctrl-p']
let $FZF_DEFAULT_COMMAND="fd --hidden --no-ignore --ignore-case --follow"
let $FZF_PREVIEW_COMMAND="cat -n {}"
let $FZF_DEFAULT_OPTS="--reverse --bind ctrl-y:preview-up,ctrl-e:preview-down,
 \ctrl-b:preview-page-up,ctrl-f:preview-page-down,
 \ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,
 \shift-up:preview-top,shift-down:preview-bottom,
 \alt-up:half-page-up,alt-down:half-page-down"

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setloclist(0, map(copy(a:lines), '{ "filename": v:val }'))
  lopen
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

" Word completion with custom spec with popup layout option
" inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
inoremap <expr> <c-x><c-k> fzf#vim#complete#word()

