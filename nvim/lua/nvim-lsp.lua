-- https://github.com/neovim/neovim/issues/23526
vim.cmd([[ set completeopt=menu,menuone,noselect ]])

-- configure this later
-- https://dev.to/elvessousa/taking-neovim-to-the-moon-274g
-- require("null-ls").setup({
--     sources = {
--         require("null-ls").builtins.code_actions.eslint,
--         require("null-ls").builtins.formatting.eslint,
--         require("null-ls").builtins.diagnostics.eslint,
--         require("null-ls").builtins.completion.spell,
--         require("null-ls").builtins.hover.dictionary,
--     },
-- })
--
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gK', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- vim.keymap.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gO', vim.lsp.buf.document_symbol, bufopts)
  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)
end

local lsp_flags = {
  debounce_text_changes = 100,
}

local lspconfig = require('lspconfig')
-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()


-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = {
    -- Clangd Language Server
    'clangd',
    -- Rust Language Server
    'rust_analyzer',
    -- Python Language Server
    'pyright',
    -- Typescript/Javascript Language Server
    'tsserver'
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        autostart = false,
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
    }
end

local diagnostics = {
  virtual_text = false, -- Disable builtin virtual text diagnostic
  virtual_improved = {
    current_line = 'only',
  },
}
vim.diagnostic.config(diagnostics)

-- Java Language Server
-- It's the combination of the 
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls 
-- and https://github.com/mfussenegger/nvim-jdtls/blob/master/lua/jdtls/setup.lua#L239-L259
-- and https://github.com/mfussenegger/nvim-jdtls/blob/master/lua/jdtls.lua#L595-L607 
-- and https://github.com/eruizc-dev/jdtls-launcher#editor-configuration
local lsp = vim.lsp;
local offset_encoding = 'utf-16';
local capabilities = vim.tbl_deep_extend(
                         'keep',
                         capabilities,
                         lsp.protocol.make_client_capabilities());
local extra_capabilities = {
    textDocument = {
      codeAction = {
        codeActionLiteralSupport = {
          codeActionKind = {
            valueSet = {
                "source.generate.toString",
                "source.generate.hashCodeEquals",
                "source.organizeImports",
            };
          };
        };
      }
    }
  }

local capabilities = vim.tbl_deep_extend('keep', capabilities, extra_capabilities);

local extendedClientCapabilities = {
  progressReportProvider = true;
  classFileContentsSupport = true;
  generateToStringPromptSupport = true;
  hashCodeEqualsPromptSupport = true;
  advancedExtractRefactoringSupport = true;
  advancedOrganizeImportsSupport = true;
  generateConstructorsPromptSupport = true;
  generateDelegateMethodsPromptSupport = true;
  moveRefactoringSupport = true;
  overrideMethodsPromptSupport = true;
  inferSelectionSupport = {"extractMethod", "extractVariable", "extractConstant"};
};

lspconfig['jdtls'].setup{
    cmd = { 'jdtls' },
    autostart = false,
    on_attach = on_attach,
    flags = lsp_flags,
    root_dir = function (fname)
        -- The idea is to have one client per mono-repo
        return lspconfig.util.root_pattern(
                '.git', -- Git repo
                -- Multi-module projects
                'mvnw', -- Maven
                'gradlew', -- Gradle
                'settings.gradle', -- Gradle
                'settings.gradle.kts' -- Gradle
            )(fname)
            or
            vim.fn.getcwd()
    end,
    capabilities = capabilities,
    init_options = {
        extendedClientCapabilities = extendedClientCapabilities,
    },
}

local request = function(bufnr, method, params, handler)
  local client = nil
  for _, c in pairs(vim.lsp.get_active_clients({ bufnr = bufnr })) do
    if c.name == 'jdtls' then
      client = c
      break
    end
  end
  if not client then
    vim.notify("No LSP client with name `jdtls` available", vim.log.levels.WARN)
  else
    client.request(method, params, handler, bufnr)
  end
end

vim.lsp.commands['java.action.organizeImports'] = function (_, ctx)
  vim.cmd([[echo "'java.action.organizeImports'"]])
  request(0, 'java/organizeImports', ctx.params, function(err, resp)
    if err then
      print('Error on organize imports: ' .. err.message)
      return
    end
    if resp then
      vim.lsp.util.apply_workspace_edit(resp, offset_encoding)
    end
  end)
end

vim.lsp.commands['java.action.overrideMethodsPrompt'] = function (_, context)
  request(context.bufnr, 'java/listOverridableMethods', 
          context.params, function(e1, result1)
    if e1 then
      print("Error getting overridable methods: " .. e1.message)
      return
    end

    local fmt = function(method)
      return string.format("%s(%s) class: %s", 
                            method.name, 
                            table.concat(method.parameters, ", "), 
                            method.declaringClass)
    end

    local selected = require('jdtls.ui').pick_many(result1.methods, "Method to override", fmt)

    if #selected < 1 then
      return
    end

    local params = {
      context = context.params,
      overridableMethods = selected
    }
    request(context.bufnr, 'java/addOverridableMethods', params, function(e2, result2)
      if e2 ~= nil then
        print("Error getting workspace edits: " .. e2.message)
        return
      end
      vim.lsp.util.apply_workspace_edit(result2, offset_encoding)
    end)
  end)
end

