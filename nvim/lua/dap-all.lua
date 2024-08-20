-- DAP Setup, adapters, and UI
-- TODO: dap for rust, go, c and c++
--
--

local dap = require("dap")

-- Set keymaps to control the debugger
-- vim.keymap.set('n', '<F5>', require 'dap'.continue)
-- vim.keymap.set('n', '<F10>', require 'dap'.step_over)
-- vim.keymap.set('n', '<F11>', require 'dap'.step_into)
-- vim.keymap.set('n', '<F12>', require 'dap'.step_out)
-- vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)
-- vim.keymap.set('n', '<leader>B', function()
--   require 'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))
-- end)


vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<F9>', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

require("dap-vscode-js").setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  --.plugged/vscode-js-debug/
  debugger_path = "/home/habib/vim-fiddle/vscode-js-debug", -- Path to vscode-js-debug installation.
  -- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})


local js_based_languages = { "typescript", "javascript", "typescriptreact" }

for _, language in ipairs(js_based_languages) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${relativeFileDirname}",
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Start Chrome with \"localhost\"",
      url = "http://localhost:3000",
      webRoot = "${workspaceFolder}",
      userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Contract Tests",
      -- trace = true, -- include debugger info
      runtimeExecutable = "jest",
      runtimeArgs = {
        "--runInBand",
        "tests/${fileBasename}",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    }
  }
end

-- - Some variables are supported:
--   - `${file}`: Active filename
--   - `${fileBasename}`: The current file's basename
--   - `${fileBasenameNoExtension}`: The current file's basename without extension
--   - `${fileDirname}`: The current file's dirname
--   - `${fileExtname}`: The current file's extension
--   - `${relativeFile}`: The current file relative to |getcwd()|
--   - `${relativeFileDirname}`: The current file's dirname relative to |getcwd()|
--   - `${workspaceFolder}`: The current working directory of Neovim
--   - `${workspaceFolderBasename}`: The name of the folder opened in Neovim
--   - `${command:pickProcess}`: Open dialog to pick process using |vim.ui.select|
--   - `${command:pickFile}`: Open dialog to pick file using |vim.ui.select|
--   - `${env:Name}`: Environment variable named `Name`, for example: `${env:HOME}`.

require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close({})
end

vim.keymap.set('n', '<leader>ui', require 'dapui'.toggle)
