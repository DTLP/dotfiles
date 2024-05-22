function ToggleRuler()
  if vim.wo.cursorcolumn then
    vim.wo.cursorcolumn = false
    vim.cmd([[highlight CursorLine guibg=#303030]])
  else
    vim.cmd([[highlight CursorLine guibg=#615232]])
    vim.cmd([[highlight CursorColumn guibg=#615232]])
    vim.wo.cursorcolumn = true
  end
end

vim.api.nvim_set_keymap("n", "<leader>tr", ":lua ToggleRuler()<CR>", { noremap = true, silent = true })
