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
    opts = {
      ensure_installed = {
        "clangd",       -- C / C++
        "rust_analyzer",-- Rust
        "html",         -- HTML
        "cssls",        -- CSS
        "ts_ls",        -- JavaScript / TypeScript
        "jsonls",       -- JSON
        "marksman",     -- Markdown
        "yamlls",       -- YAML
        "bashls",       -- Shell scripts
      },
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      end

      vim.lsp.config("clangd", { on_attach = on_attach, capabilities = capabilities })
      vim.lsp.config("rust_analyzer", { on_attach = on_attach, capabilities = capabilities })
      vim.lsp.config("html", { on_attach = on_attach, capabilities = capabilities })
      vim.lsp.config("cssls", { on_attach = on_attach, capabilities = capabilities })
      vim.lsp.config("ts_ls", { on_attach = on_attach, capabilities = capabilities })
      vim.lsp.config("jsonls", { on_attach = on_attach, capabilities = capabilities })
      vim.lsp.config("marksman", { on_attach = on_attach, capabilities = capabilities })
      vim.lsp.config("yamlls", { on_attach = on_attach, capabilities = capabilities })
      vim.lsp.config("bashls", { on_attach = on_attach, capabilities = capabilities })

      vim.lsp.config("lua_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = { diagnostics = { globals = { "vim" } } },
        },
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.sh",
        callback = function()
          vim.fn.jobstart({ "shfmt", "-w", vim.fn.expand("%") })
        end,
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.html", "*.css", "*.js", "*.json", "*.yaml", "*.yml", "*.md" },
        callback = function()
          vim.fn.jobstart({ "prettier", "--write", vim.fn.expand("%") })
        end,
      })
    end,
  },
}

