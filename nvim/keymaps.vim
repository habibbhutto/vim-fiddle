
nnoremap <silent> <leader><leader> :nohlsearch<bar>checktime<CR>

" Telescope
nnoremap <silent> <leader>tl :Telescope<cr>

" Git
nnoremap <silent> <leader>gf :GitFiles<cr>
nnoremap <silent> <leader>gs :GitFiles?<cr>
nnoremap <silent> <leader>gst :Git stash list<cr>
nnoremap <silent> <leader>gc :BCommits<cr>
nnoremap <silent> <leader>gca :Commits<cr>
nnoremap <silent> <leader>gb :Git branch --list<cr>
nnoremap <silent> <leader>gg :Git<cr>

" temporary fix for fugitive cmdheight issue 
autocmd BufEnter fugitive://* set cmdheight=1
autocmd BufLeave fugitive://* set cmdheight=0

nnoremap <leader>gp :Git push

" Jump between hunks
nmap [c <Plug>(GitGutterNextHunk)
nmap ]c <Plug>(GitGutterPrevHunk)

" Files and search
nnoremap <silent> <leader>H :History<cr>
nnoremap <silent> <leader>F :Files<cr>
nnoremap <silent> <leader>f :GitFiles<cr>
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>tb :BTags<cr>
nnoremap <silent> <leader>tt :Tags<cr>
nnoremap <silent> <leader>sf :Rg<cr>
nnoremap <silent> <leader>sw yw :Rg<cr><cmd>put +<cr>
nnoremap <silent> <leader>sb yw :BLines<cr><cmd>put +<cr>

nnoremap <silent> <space><space> :call Startup()<BAR>NvimTreeToggle<CR>

" Jump to next and previous method
nnoremap <silent> <M-S-m> [m
nnoremap <silent> <M-m> ]m

" Navigate lists
nnoremap <silent> <C-n> :cn<cr>
nnoremap <silent> <C-p> :cp<cr>
nnoremap <silent> ]] :cn<cr>
nnoremap <silent> [[ :cp<cr>

nnoremap n nzz
nnoremap N Nzz

nnoremap Y y$
nnoremap O O<Esc>
nnoremap o o<Esc>

" Switch window focus
" in terminal mode
tnoremap <silent> <leader><leader> <C-\><C-n>:nohlsearch<CR>
tnoremap <silent> <M-h> <C-\><C-n><C-w>h
tnoremap <silent> <M-j> <C-\><C-n><C-w>j
tnoremap <silent> <M-k> <C-\><C-n><C-w>k
tnoremap <silent> <M-l> <C-\><C-n><C-w>l
" in insert mode
inoremap <silent> <M-h> <C-\><C-n><C-w>h
inoremap <silent> <M-j> <C-\><C-n><C-w>j
inoremap <silent> <M-k> <C-\><C-n><C-w>k
inoremap <silent> <M-l> <C-\><C-n><C-w>l
" in normal mode
nnoremap <silent> <M-h> <c-w>h
nnoremap <silent> <M-j> <c-w>j
nnoremap <silent> <M-k> <c-w>k
nnoremap <silent> <M-l> <c-w>l

" Switch buffers
" in normal mode
noremap <silent> <M-S-k> :bp<cr>
noremap <silent> <M-S-j> :bn<cr>
noremap <silent> <M-S-h> :bfirst<cr>
noremap <silent> <M-S-l> :blast<cr>
" in insert mode
inoremap <silent> <M-S-k> <C-\><C-n>:bp<cr>
inoremap <silent> <M-S-j> <C-\><C-n>:bn<cr>
inoremap <silent> <M-S-h> <C-\><C-n>:bfirst<cr>
inoremap <silent> <M-S-l> <C-\><C-n>:blast<cr>
" in terminal mode
tnoremap <silent> <M-S-k> <C-\><C-n>:bp<cr>
tnoremap <silent> <M-S-j> <C-\><C-n>:bn<cr>
tnoremap <silent> <M-S-h> <C-\><C-n>:bfirst<cr>
tnoremap <silent> <M-S-l> <C-\><C-n>:blast<cr>

" Resize windows
noremap <silent> <C-down> :resize +1<cr>
noremap <silent> <C-up> :resize -1<cr>
noremap <silent> <C-right> :vert resize +1<cr>
noremap <silent> <C-left> :vert resize -1<cr>

tnoremap <silent> <C-down> <C-\><C-n>:resize +1<cr>
tnoremap <silent> <C-up> <C-\><C-n>:resize -1<cr>
tnoremap <silent> <C-right> <C-\><C-n>:vert resize +1<cr>
tnoremap <silent> <C-left> <C-\><C-n>:vert resize -1<cr>

inoremap <silent> <M-PageUp> <C-\><C-n><PageUp>
inoremap <silent> <M-PageDown> <C-\><C-n><PageDown>
tnoremap <silent> <M-PageUp> <C-\><C-n><PageUp>
tnoremap <silent> <M-PageDown> <C-\><C-n><PageDown>

" Start a terminal at the bottom
noremap <silent> <leader>t :bot bel new<bar>term<cr>a

" Shift buffer lines up and down
noremap <M-up> :m -2<cr>
noremap <M-down> :m +1<cr>

" Save current buffer
nnoremap <leader>w <cmd>w<cr>
inoremap <C-s> <cmd>w<cr>


vmap RRC :!psql service=ContractProd -a -t -A<enter>
vmap RRL :!psql service=LoyaltyProd -a -t -A<enter>
vmap RRW :!psql service=WebshopProd -a -t -A<enter>
vmap RRT :!psql service=test-cdm -a -t -A<enter>
vmap RRTC :!psql service=test-contract -a <enter>
vmap RRTL :!psql service=test-loyalty -a <enter>
vmap RRTN :!psql service=test-newsletter -a <enter>
vmap JJJ :!jq<enter>

" noremap grt <cmd>bot term cd '%:h' && yarn test '%' 2>&1 <bar> tee %:t.log <CR>
noremap grt <cmd>bot term cd '%:h' && yarn jest tests/%:t 2>&1 <bar> tee %:t.log <CR>
noremap grtd <cmd>bot term cd '%:h' && yarn test:debug '%' 2>&1 <bar> tee %:t.log <CR>
noremap <leader>ttl <cmd>e %.log<cr>
noremap <leader>ttt <cmd>e %:p:h/tests/%:t:r.spec.ts<cr>
noremap <leader>ttf <cmd>e %:p:h:h/%:t:r:r.ts<cr>


noremap <leader>jjj :diffget //2 <bar> diffupdate<enter>
noremap <leader>kkk :diffget //3 <bar> diffupdate<enter>
