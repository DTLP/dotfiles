return {
  -- add gruvbox
  -- { "wittyjudge/gruvbox-material.nvim" },
  { "tanvirtin/monokai.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox-material",
      colorscheme = "monokai_pro",
    },
  },
}
