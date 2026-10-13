return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = { php = { "phpcs", "phpstan" } }
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
      callback = function()
        local available = {}
        for _, name in ipairs(lint._resolve_linter_by_ft(vim.bo.filetype)) do
          local linter = lint.linters[name]
          local cmd = type(linter) == "function" and linter().cmd or linter and linter.cmd
          if type(cmd) == "function" then cmd = cmd() end
          if cmd and vim.fn.executable(cmd) == 1 then table.insert(available, name) end
        end
        if #available > 0 then lint.try_lint(available) end
      end,
    })
  end,
}
