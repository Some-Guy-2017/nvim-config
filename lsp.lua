local lspconfig = require('lspconfig')
local coq = require('coq')
lspconfig.tsserver.setup(coq.lsp_ensure_capabilities())
lspconfig.jdtls.setup(coq.lsp_ensure_capabilities())

-- vim.api.nvim_set_keymap("n", "L", "<cmd>lua setup_lsps()<CR>", {noremap=true})
