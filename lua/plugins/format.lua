return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = { c = { "clang-format" }, asm = { "asmfmt" } },
    format_on_save = { timeout_ms = 500 },
  },
}
