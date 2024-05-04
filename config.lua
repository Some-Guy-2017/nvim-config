require("nvim-autopairs").setup {}

-- icon-picker config
require("icon-picker").setup {disable_legacy_commands = true}
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader>e", "<cmd>IconPickerNormal<cr>", opts)
vim.keymap.set("i", "<C-e>", "<cmd>IconPickerInsert<cr>", opts)

-- LSP config
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
capabilities.publishDiagnostics = false
require('lspconfig').tsserver.setup {capabilities = capabilities}
require('lspconfig').jdtls.setup {
    capabilities = capabilities,
    handlers = {
        ["textDocument/publishDiagnostics"] = function() end,
    },
}
require('lspconfig').texlab.setup {capabilities = capabilities}

-- ufo config
vim.o.foldcolumn = '1' -- display one fold column, '0' disables
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

require('ufo').setup()

-- telescope config
function delete_word()
    vim.cmd('norm db')
end

require('telescope').load_extension('fzy_native')
require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                ['<c-d>'] = require('telescope.actions').delete_buffer,
            },
            i = {
                ['<c-d>'] = require('telescope.actions').delete_buffer,
                ['<c-h>'] = delete_word,
            }
        },
        ripgrep_arguments = {
            '--hidden',
            '--with-filename',
            '--line-number',
        }
    },
}

-- colorizer setup
-- https://github.com/norcalli/nvim-colorizer.lua#customization
--require('colorizer').setup()



--[[
vim.api.nvim_create_autocmd({"BufLeave"}, {
    callback = function(env)
        local mode = vim.api.nvim_get_mode().mode
        vim.b.prev_mode = mode
    end
})

vim.api.nvim_create_autocmd({"BufEnter"}, {
    callback = function(env)
        local prev_mode = vim.b.prev_mode
        if prev_mode == "i" then
            vim.cmd("startinsert")
            vim.cmd('norm l')
        elseif prev_mode == "n" then

        end
    end
})
]]

--[[
vim.keymap.set('n', "zG", function()
    local spell_name = vim.api.nvim_buf_get_name(0):gsub("/", "$$")
    local spell_path = "/home/joe/.config/nvim/bespoke_spell/" .. spell_name .. "/bespoke.utf-8.add"
    
    local prev_spell = vim.o.spellfile
    vim.o.spellfile = spell_path
    vim.api.nvim_feedkeys('zg', 'n', false)
    vim.o.spellfile = prev_spell

end, {silent = false})
]]
