return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({ "c", "asm", "nasm", "make", "cmake" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "asm", "nasm", "make", "cmake" },
      callback = function() vim.treesitter.start() end,
    })
  end,
}
