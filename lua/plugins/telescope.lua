local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-live-grep-args.nvim",
    version = "^1.0.0",
  },
  opts = {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
      },
    },
  },
}

M.config = function()
  -- local keyset = vim.keymap.set
  -- local opts = { silent = true, noremap = false, expr = true, replace_keycodes = false }
  -- keyset("n", "<leader>fg", ':lua require("telescope:).extensions.live_grep_args.live_grep_args()<CR>', opts)
  vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
end

return M
