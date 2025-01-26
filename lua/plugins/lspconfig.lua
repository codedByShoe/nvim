return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      bashls = {},
      templ = {},
      cssls = {},
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
}
