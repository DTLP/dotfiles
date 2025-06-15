-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- lsp
vim.keymap.set("n", "<leader>S", "<cmd>LspStop<CR>", { desc = "LspStop" })
-- Go
require("lspconfig").gopls.setup({
  on_attach = function(_, bufnr)
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { noremap = true, silent = true }

    -- buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<leader>h", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "<leader>H", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<space>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  end,
})

-- surrounding words
vim.keymap.set("n", "<leader>wsq", 'ciw""<Esc>P', { desc = "Word Surround Quotes" })

-- telescope symbols
vim.keymap.set("n", "<leader>es", "<cmd>Telescope symbols<cr>", { desc = "Find Symbols" })

-- nvim go related
vim.keymap.set("n", "<leader>gt", "<cmd>GoTest<CR>", { desc = "Go Test" })

-- ThePrimeagen
vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fs", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- My own
vim.keymap.set("n", "<leader>date", ":put =strftime('%Y-%m-%d')<CR>")
