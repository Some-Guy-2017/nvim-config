require("nvim-autopairs").setup {}

-- nvim-lint config
--[[
require("lint").linters_by_ft = {
  markdown = {"vale"},
}
vim.api.nvim_create_autocmd({"BufWritePost"}, {
    callback = function()
        require("lint").try_lint()
    end
})
]]

-- icon-picker config
require("icon-picker").setup {disable_legacy_commands = true}
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader>e", "<cmd>IconPickerNormal<cr>", opts)
vim.keymap.set("i", "<C-e>", "<cmd>IconPickerInsert<cr>", opts)

-- LSP config
local capabilities = require('cmp_nvim_lsp').default_capabilities()
--require'lspconfig'.tsserver.setup {capabilities = capabilities}
--require'lspconfig'.jdtls.setup {capabilities = capabilities}
--require'lspconfig'.texlab.setup {capabilities = capabilities}

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

-- HighStr config
--[[
local high_str = require("high-str")
high_str.setup({
    verbosity = 0, -- (verbosity > 0) enables verbose output
    saving_path = "/home/joe/.config/nvim/highlights/",
    highlight_colors = {
        -- "smart" means the foreground color will be changed to get better contrast against background
        -- color_id = {"bg_hex_code",<"fg_hex_code"/"smart">}
        color_0  = {"#0c0d0e", "smart"}, -- Cosmic charcoal
        color_1  = {"#e5c07b", "smart"}, -- Pastel yellow
        color_2  = {"#7FFFD4", "smart"}, -- Aqua menthe
        color_3  = {"#8A2BE2", "smart"}, -- Proton purple
        color_4  = {"#FF4500", "smart"}, -- Orange red
        color_5  = {"#008000", "smart"}, -- Office green
        color_6  = {"#0000FF", "smart"}, -- Just blue
        color_7  = {"#FFC0CB", "smart"}, -- Blush pink
        color_8  = {"#FFF9E3", "smart"}, -- Cosmic latte
        color_9  = {"#7d5c34", "smart"}, -- Fallow brown
        color_10 = {"#8ad2e3", "smart"}, -- Default highlight color
        color_11 = {"#edd28a", "smart"},
    }
})
--]]

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

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    callback = function(env)
    end
})
