return {
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = { -- add/modify theme and palette colors
          palette = {},
          theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        theme = "dragon", -- Load "wave" theme when 'background' option is not set
        background = { -- map the value of 'background' option to a theme
          dark = "wave", -- try "dragon" !
          light = "lotus",
        },
      })
      -- setup must be called before loading
      -- vim.cmd("colorscheme kanagawa")
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  {
    "hrsh7th/cmp-cmdline",
    config = function()
      local cmp = require("cmp")
      -- `/` cmdline setup.
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = function()
      return {}
    end,
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = { "node_modules", "vendor", "__pycache__", "obj" },
      },
    },
  },

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        bashls = {},
        csharp_ls = {},
        templ = {},
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        gopls = {
          cmd = { "gopls" },
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
        },
        cssls = {},
        sqlls = {
          cmd = { "sql-language-server", "up", "--method", "stdio" },
          filetypes = { "sql", "mysql" },
        },
        tsserver = {
          filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
        },
        html = {
          configurationSection = { "html", "css", "javascript" },
          embeddedLanguages = {
            css = true,
            javascript = true,
          },
          provideFormatter = true,
          settings = {
            format = {
              indentInnerHtml = true,
            },
          },
          filetypes = { "html", "tmpl", "hbs", "gohtml", "templ", "htmldjango", "phtml" },
        },
        jsonls = {},
        intelephense = {
          cmd = { "intelephense", "--stdio" },
          filetypes = { "php" },
        },
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            hint = {
              enable = true,
              arrayIndex = "Disable", -- "Enable" | "Auto" | "Disable"
              await = true,
              paramName = "Disable", -- "All" | "Literal" | "Disable"
              paramType = false,
              semicolon = "Disable", -- "All" | "SameLine" | "Disable"
              setType = false,
            },
            diagnostics = { disable = { "missing-fields" } },
          },
        },
        tailwindcss = {
          filetypes = {
            "astro",
            "astro-markdown",
            "blade",
            "tmpl",
            "gohtml",
            "html",
            "liquid",
            "markdown",
            "mdx",
            "phtml",
            "twig",
            "css",
            "ejs",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "svelte",
            "templ",
          },
        },
        marksman = {
          filetypes = { "markdown", "markdown.mdx" },
        },
        emmet_ls = {
          filetypes = {
            "html",
            "htmldjango",
            "twig",
            "hbs",
            "gohtml",
            "templ",
            "typescriptreact",
            "blade",
            "phtml",
            "javascriptreact",
          },
          init_options = {
            html = {
              options = {
                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                ["bem.enabled"] = true,
              },
            },
          },
        },
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.sql" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "go",
        "php",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local theme = function()
        local colors = {
          darkgray = "#16161d",
          gray = "#727169",
          white = "#DCD7BA",
          innerbg = nil,
          outerbg = nil,
          normal = "#7E9CD8",
          insert = "#98bb6c",
          visual = "#FF9E3B",
          replace = "#e46876",
          command = "#e6c384",
        }
        return {
          inactive = {
            a = { fg = colors.white, bg = colors.outerbg, gui = "bold" },
            b = { fg = colors.white, bg = colors.outerbg },
            c = { fg = colors.white, bg = colors.innerbg },
          },
          visual = {
            a = { fg = colors.visual, bg = colors.outerbg, gui = "bold" },
            b = { fg = colors.white, bg = colors.outerbg },
            c = { fg = colors.white, bg = colors.innerbg },
          },
          replace = {
            a = { fg = colors.darkgray, bg = colors.outerbg, gui = "bold" },
            b = { fg = colors.white, bg = colors.outerbg },
            c = { fg = colors.white, bg = colors.innerbg },
          },
          normal = {
            a = { fg = colors.normal, bg = colors.outerbg, gui = "bold" },
            b = { fg = colors.white, bg = colors.outerbg },
            c = { fg = colors.white, bg = colors.innerbg },
          },
          insert = {
            a = { fg = colors.insert, bg = colors.outerbg, gui = "bold" },
            b = { fg = colors.white, bg = colors.outerbg },
            c = { fg = colors.white, bg = colors.innerbg },
          },
          command = {
            a = { fg = colors.command, bg = colors.outerbg, gui = "bold" },
            b = { fg = colors.white, bg = colors.outerbg },
            c = { fg = colors.white, bg = colors.innerbg },
          },
        }
      end

      return {
        options = {
          component_separators = { left = " ", right = " " },
          section_separators = { left = " ", right = " " },
          theme = theme,
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
        },
        sections = {
          lualine_a = { { "mode", icon = "" } },
        },

        extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
      }
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        progress = {
          enabled = true,
          view = "mini",
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      views = {
        mini = {
          win_options = {
            winblend = 0,
          },
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      cmdline = {
        enabled = true,
        view = "cmdline",
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
      },
    },
  -- stylua: ignore
  keys = {
    { "<leader>sn", "", desc = "+noice"},
    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
    { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
    { "<leader>snt", function() require("noice").cmd("pick") end, desc = "Noice Picker (Telescope/FzfLua)" },
    { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
    { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
  },
    config = function(_, opts)
      -- HACK: noice shows messages from before it was enabled,
      -- but this is not ideal when Lazy is installing plugins,
      -- so clear the messages in this case.
      if vim.o.filetype == "lazy" then
        vim.cmd([[messages clear]])
      end
      require("noice").setup(opts)
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    opts = function()
      require("transparent").setup({
        groups = {
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
        },
      })
    end,
  },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "prettier",
        "ruff",
      },
    },
  },
}
