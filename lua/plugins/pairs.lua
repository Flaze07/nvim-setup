local M = {
  "neoclide/coc-pairs",
}

M.config = function()
  local keyset = vim.keymap.set

  local opts = { silent = true, expr = true, noremap = true }
  keyset("i", "<cr>", [[coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
end

return M
