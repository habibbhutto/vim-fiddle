vim.loader.enable()

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[
   autocmd VimEnter * source ~/vim-fiddle/nvim/colorscheme.vim
   autocmd VimEnter * call Startup()
   " Disabling it for now as it's seems slower
   " autocmd VimEnter * lua require('treesitter')
   autocmd VimEnter * lua require('tree')
   autocmd VimEnter * lua require('dap-all')
   " autocmd VimEnter * call ToggleZenMode()
]]);

vim.cmd 'source ~/vim-fiddle/nvim/plugins.vim'
vim.cmd 'source ~/vim-fiddle/nvim/basics.vim'
vim.cmd 'source ~/vim-fiddle/nvim/lazy-start.vim'
vim.cmd 'source ~/vim-fiddle/nvim/fzf.vim'
vim.cmd 'source ~/vim-fiddle/nvim/keymaps.vim'

-- TODO: improvements and power features
--
--       Test
--       * go the test file of current file
--       * run the current test file
--       * run the current test function
--       * go to the failing test
--
--       Colors
--       * color scheme improvements
--       * change scheme based on gnome style
--
--       Search
--       * find out current symbol references in a fzf like popup window
--       * popup outline of current file
--       * vimgrep, grep, cwindow, qlists, lwindow, and shortcuts
--
--       Database Query Execution
--       * run selected query
--       * display results in json form
--       * display results in table form or extended table form
-- 
--       Code Maps and Graphs
--       * display graph of current symbol i.e. class, function, property, etc
--       * display graph of current file
--
--       Datadog logs, APMs, Alerts
--       * take me to datadog logs of this error, warning, or info
--       * take me to apm of this service
--
--       Elastic Search
--       * take me to datadog logs of this error, warning, or info
--       * take me to apm of this service
--
--       Confluent
--       * kafka configs
--       * kafka topics
--
--       cdm-menifest
--       * kafka configs
--       * kafka topics
--
--       K8s
--       * search containers
--       * shell into a desired container
--       * scale out a service
--       * scale in a service
--       * get deployment description
--
--
--
