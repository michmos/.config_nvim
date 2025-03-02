-- LSP keymaps
return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      --   disable keymap because K is used for 5k
      keys[#keys + 1] = { "K", false }
      --   <leader>i can be used for hovering, instead of K
      keys[#keys + 1] = { "<leader>i", vim.lsp.buf.hover, desc = "Hover" }
    end,
	opts = {
			autoformat = false,
		},
  },
}
