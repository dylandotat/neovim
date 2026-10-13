return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = { c = { "clang-format" }, asm = { "asmfmt" }, php = { "php_cs_fixer" } },
    format_on_save = { timeout_ms = 3000, lsp_format = "fallback" },
  },
}
