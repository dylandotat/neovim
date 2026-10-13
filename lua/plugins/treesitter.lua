return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "c", "asm", "nasm", "make", "cmake", "php", "phpdoc", "html", "css", "javascript", "json",
      "yaml", "lua", "sql", "bash", "markdown", "markdown_inline", "vim", "vimdoc",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        if pcall(vim.treesitter.start, ev.buf) then
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
