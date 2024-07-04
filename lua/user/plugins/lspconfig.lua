return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
  },
  config = function()
    local on_attach = function(client, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end
      local builtin = require('telescope.builtin')
      nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
      nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Action')

      nmap('gd', builtin.lsp_definitions, 'Goto Definition')
      nmap('gr', builtin.lsp_references, 'Goto References')
      nmap('gI', builtin.lsp_implementations, 'Goto Implementation')
      nmap('<leader>lD', builtin.lsp_type_definitions, 'Type Definition')
      nmap('<leader>ls', builtin.lsp_document_symbols, 'Document Symbols')

      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

      -- Lesser used LSP functionality
      nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
      if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
        nmap('<leader>th', function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = 0 }, { bufnr = 0 })
        end, 'Toggle Inlay Hints')
      end
    end

    local icons = require('user.core.icons')
    local mason_lspconfig = require 'mason-lspconfig'

    local default_diagnostic_config = {
      signs = {
        active = true,
        values = {
          { name = "DiagnosticSignError", text = icons.diagnostics.Error },
          { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
          { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
          { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
        },
      },
      virtual_text = true,
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }

    vim.diagnostic.config(default_diagnostic_config)
    for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
      vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
    end
    -- mason-lspconfig requires that these setup functions are called in this order
    -- before setting up the servers.
    require('mason').setup()
    require('mason-lspconfig').setup()

    -- NOTE: add custom filetypes for servers
    vim.filetype.add({
      extension = {
        templ = "templ",
      },
    })

    local servers = {
      bashls = {},
      pyright = {
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
              useLibraryCodeForTypes = true
            }
          }
        }
      },
      gopls = {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
      },
      cssls = {},
      volar = {},
      templ = {},
      sqlls = {
        cmd = { "sql-language-server", "up", "--method", "stdio" },
        filetypes = { "sql", "mysql" },
      },
      tsserver = {
        filetypes = { 'javascript', 'typescript', "javascriptreact", "typescriptreact" }
      },
      html = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
          css = true,
          javascript = true
        },
        provideFormatter = true,
        settings = {
          format = {
            indentInnerHtml = true
          },
        },
        filetypes = { 'html', 'tmpl', 'hbs', 'gohtml', 'templ', 'htmldjango' }
      },
      jsonls = {},
      intelephense = {
        cmd = { "intelephense", "--stdio" },
        filetypes = { 'php' }
      },
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          hint = {
            enable = true,
            arrayIndex = "Disable", -- "Enable" | "Auto" | "Disable"
            await = true,
            paramName = "Disable",  -- "All" | "Literal" | "Disable"
            paramType = false,
            semicolon = "Disable",  -- "All" | "SameLine" | "Disable"
            setType = false,
          },
          diagnostics = { disable = { 'missing-fields' } },
        },
      },
      tailwindcss = {
        filetypes = {
          "astro", "astro-markdown", "blade", "tmpl", "gohtml", "html", "liquid", "markdown", "mdx", "php", "twig",
          "css", "ejs", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte",
          "templ"
        },
      },
      marksman = {
        filetypes = { "markdown", "markdown.mdx" }
      },
      emmet_ls = {
        filetypes = { 'html', 'htmldjango', 'twig', 'hbs', 'gohtml', 'templ', 'typescriptreact', 'blade', "javascriptreact" },
        init_options = {
          html = {
            options = {
              -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
              ["bem.enabled"] = true,
            },
          },
        }
      }
    }

    -- Setup neovim lua configuration
    require('neodev').setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Ensure the servers above are installed
    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    -- configure blade lsp
    local lspconfig = require("lspconfig")
    local configs = require("lspconfig.configs")

    configs.blade = {
      default_config = {
        -- Path to the executable: laravel-dev-generators
        cmd = { vim.fn.expand("$HOME/laravel-dev-tools/builds/laravel-dev-tools"), "lsp" },
        filetypes = { 'blade' },
        root_dir = function(pattern)
          local util = require("lspconfig.util")
          local cwd = vim.loop.cwd()
          local root = util.root_pattern("composer.json", ".git", ".phpactor.json", ".phpactor.yml")(pattern)

          -- prefer cwd if root is a descendant
          return util.path.is_descendant(cwd, root) and cwd or root
        end,
        settings = {},
      },
    }
    -- Set it up
    lspconfig.blade.setup {
      -- Capabilities is specific to my setup.
      capabilities = capabilities
    }
    -- setup default configs
    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
    }
    -- Diagnostic keymaps
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
  end
}
