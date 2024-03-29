call plug#begin('~/.vim/.plugged')
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'sainnhe/everforest'
  Plug 'morhetz/gruvbox'
  Plug 'sainnhe/gruvbox-material'
  Plug 'yuttie/inkstained-vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'w0ng/vim-hybrid'

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  Plug 'prabirshrestha/vim-lsp'
call plug#end()
