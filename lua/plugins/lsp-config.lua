return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = {
          "clangd",        -- C/C++
          "rust_analyzer", -- Rust
          "html",          -- HTML
          "cssls",         -- CSS
          "ts_ls",         -- JS / TS
          "jsonls",        -- JSON
          "marksman",      -- Markdown
          "yamlls",        -- YAML
          "bashls",        -- Shell
          "lua_ls",        -- Lua
        },
        automatic_installation = true,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "LspAttach",
        once = true,
        callback = function()
          local capabilities = require("cmp_nvim_lsp").default_capabilities()

          local on_attach = function(_, bufnr)
            local opts = { buffer = bufnr, silent = true }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          end

          mason_lspconfig.setup_handlers({
	function(server_name)
          require("lspconfig")[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end,
            ["lua_ls"] = function()
              vim.lsp.config("lua_ls", {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                  Lua = {
                    diagnostics = { globals = { "vim" } },
                  },
                },
              })
            end,
          })
        end,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
   config = function()
   local lspconfig = require("lspconfig")
   lspconfig.lua_ls.setup({})
 end
  }
}
