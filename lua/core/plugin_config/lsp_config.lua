require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "jdtls", "bashls","pyright" }
})


require("lspconfig").lua_ls.setup {}
require("lspconfig").jdtls.setup {}
require("lspconfig").bashls.setup {}


local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())


require('lspsaga').setup({
  code_action_icon = "💡",
  symbol_in_winbar = {
    in_custom = false,
    enable = true,
    separator = ' ',
    show_file = true,
    file_formatter = ""
  },
})

vim.keymap.set("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', { silent = true })
vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

