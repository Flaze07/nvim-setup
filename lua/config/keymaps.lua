-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

function Trim()
  local save = vim.fn.winsaveview()
  vim.cmd("keeppatterns %s/\\s\\+$\\|\\r$//e")
  vim.fn.winrestview(save)
end

function Paste_and_trim()
  -- Perform the default paste action
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("p", true, false, true), "n", false)
  -- Call the trim function
  vim.schedule(function()
    Trim()
  end)
end

vim.keymap.set("n", "p", Paste_and_trim, { noremap = true, silent = true })

if vim.g.neovide == true then
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.2
  vim.api.nvim_set_keymap(
    "n",
    "<C-+>",
    ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
    { silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "<C-->",
    ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
    { silent = true }
  )
  vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end
