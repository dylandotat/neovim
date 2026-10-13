return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",       -- index the whole project in the background
          "--clang-tidy",             -- extra lint diagnostics
          "--header-insertion=iwyu",  -- auto-add #includes on completion
          "--completion-style=detailed",
          "--function-arg-placeholders=true",
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_markers = { "compile_commands.json", "compile_flags.txt", ".clangd", ".git" },
      })

      vim.lsp.enable({ "clangd", "intelephense" })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local map = function(keys, fn)
            vim.keymap.set("n", keys, fn, { buffer = ev.buf })
          end
          map("gd", vim.lsp.buf.definition)
          map("gr", vim.lsp.buf.references)
          map("K", vim.lsp.buf.hover)
          map("<leader>rn", vim.lsp.buf.rename)
          map("<leader>ca", vim.lsp.buf.code_action)
          map("<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>")
        end,
      })
    end,
  },
}
