return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        pyright = {},
        bashls = {},
        gopls = {},
        yamlls = {},
        marksman = {},
        terraformls = {},
        helm_ls = {},
      },
    },
  },
}
