require("nvim-autopairs").setup {}

-- icon-picker config
require("icon-picker").setup {disable_legacy_commands = true}
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader>e", "<cmd>IconPickerNormal<cr>", opts)
vim.keymap.set("i", "<C-e>", "<cmd>IconPickerInsert<cr>", opts)

-- LSP init
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require'lspconfig'.tsserver.setup {capabilities = capabilities}
require'lspconfig'.jdtls.setup {capabilities = capabilities}
require'lspconfig'.texlab.setup {capabilities = capabilities}

-- Telescope init
require("telescope").setup()
require('telescope').load_extension('fzy_native')
