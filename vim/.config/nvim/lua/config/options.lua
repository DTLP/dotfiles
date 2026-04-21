-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- iamcco/markdown-preview
vim.cmd([[
  function! OpenMarkdownPreview(url)
    execute "silent !xdg-open " . a:url
  endfunction
]])

vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
