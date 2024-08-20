call plug#begin('~/.config/nvim/.plugged')
  Plug 'sainnhe/gruvbox-material'
  Plug 'shaunsingh/nord.nvim'
  Plug 'rktjmp/lush.nvim'
  Plug 'mcchrish/zenbones.nvim'
  Plug 'EdenEast/nightfox.nvim'

  Plug 'junegunn/fzf.vim'
      Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

  Plug 'tpope/vim-fugitive'
      Plug 'airblade/vim-gitgutter'

  " LSP
  Plug 'sbdchd/neoformat'
  Plug 'neovim/nvim-lspconfig'
      Plug 'mfussenegger/nvim-jdtls'
      Plug 'jose-elias-alvarez/null-ls.nvim'
      Plug 'hrsh7th/nvim-cmp'
          Plug 'hrsh7th/cmp-nvim-lsp'
          Plug 'hrsh7th/cmp-path'
          Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
          Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
          Plug 'hrsh7th/cmp-cmdline'
          Plug 'hrsh7th/cmp-buffer'
          Plug 'saadparwaiz1/cmp_luasnip'
          Plug 'L3MON4D3/LuaSnip'
              Plug 'rafamadriz/friendly-snippets'
              Plug 'petertriho/cmp-git'

  Plug 'mfussenegger/nvim-dap'
  Plug 'microsoft/vscode-js-debug', { 'do': 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out' }
  Plug 'mxsdev/nvim-dap-vscode-js'
  Plug 'nvim-neotest/nvim-nio'
  Plug 'rcarriga/nvim-dap-ui'

  " Tree-sitter
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-refactor'
    " The following plugins are slow impacting editing experience 
    " Plug 'nvim-treesitter/nvim-treesitter-context'
    " Plug 'ziontee113/syntax-tree-surfer'

  Plug 'nvim-tree/nvim-tree.lua'
  " Plug 'nvim-neo-tree/neo-tree.nvim', { 'branch': 'v3.x'}
      Plug 'kyazdani42/nvim-web-devicons'
  "    Plug 'MunifTanjim/nui.nvim'
  "    Plug 's1n7ax/nvim-window-picker'

  " Search, sort and pick
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-symbols.nvim'

  Plug 'nvim-lua/plenary.nvim'

  " Design tools
  Plug 'norcalli/nvim-colorizer.lua'
  " Markdown preview 
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
call plug#end()

" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END
