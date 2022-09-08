lua << EOF
require('telescope').setup{
    defaults = {
      layout_strategy = 'vertical',
      layout_config = { 
        height = 0.98,
        width = 0.98,
        preview_height = 0.6,
      },
      scroll_strategy = 'limit',
    },
    pickers = {
      find_files = {
        hidden = true,
        no_ignore = true,
      }
    }
  }
EOF


