-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- try this: vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
--

opt.ignorecase = true

-- pandoc related

opt.spell = false
opt.foldmethod = "manual"
opt.foldenable = false

-- iamcco/markdown-preview
vim.cmd([[
  function! OpenMarkdownPreview(url)
    execute "silent !xdg-open " . a:url
  endfunction
]])

vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
