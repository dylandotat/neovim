return {
  "saghen/blink.cmp",
  version = "1.*",
  opts = {
    keymap = { preset = "super-tab" },
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
}
