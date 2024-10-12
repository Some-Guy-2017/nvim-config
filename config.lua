require("nvim-autopairs").setup {}

-- icon-picker config
require("icon-picker").setup {disable_legacy_commands = true}
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ue", "<cmd>IconPickerNormal<cr>", opts)
vim.keymap.set("i", "<c-e>", "<cmd>IconPickerInsert<cr>", opts)

-- LSP config
if vim.g.lsp_setup == nil then
vim.g.lsp_setup = false


local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}
capabilities.publishDiagnostics = false
local handlers = {
    ["textDocument/publishDiagnostics"] = function() end,
},
require('lspconfig').tsserver.setup { capabilities = capabilities }
require('lspconfig').jdtls.setup {
    capabilities = capabilities,
    handlers = handlers,
}

require('lspconfig').texlab.setup { capabilities = capabilities }
require('lspconfig').ccls.setup { capabilities = capabilities }

require('lspconfig').lua_ls.setup {
    capabilities = capabilities,
    handlers = handlers,
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
            return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        })
    end,
    settings = {
        Lua = {}
    }
}



end

-- JDTLS config
--[[
local root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1])
local project_dir
if root_dir == nil then
    project_dir = vim.fn.getcwd()
else
    project_dir = root_dir
end
local project_name = string.gsub(project_dir, "/", "%%%%")
local workspace_dir = "/home/joe/.jdtls-workspaces/" .. project_name .. "/"
local config = {
    cmd = {
        '/home/joe/opt/jdtls/bin/jdtls',
        '-data', workspace_dir,
    },
    root_dir = root_dir,
    capabilities = capabilities,
}
require('jdtls').start_or_attach(config)
]]

-- ufo config
vim.o.foldcolumn = '1' -- display one fold column, '0' disables
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

require('ufo').setup()

-- telescope config
local function delete_word()
    vim.cmd('norm db')
end

require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                ['<c-d>'] = require('telescope.actions').delete_buffer,
                ['<c-c>'] = require('telescope.actions').close,
            },
            i = {
                ['<c-d>'] = require('telescope.actions').delete_buffer,
                ['<c-h>'] = delete_word,
            },
        },
        ripgrep_arguments = {
            '--hidden',
            '--with-filename',
            '--line-number',
        },
        file_ignore_patterns = {
            ".git/*",
            "build/*",
            "src/build/*",
            "tags",
            "img/*",
        }
    },
}
require('telescope').load_extension('fzy_native')

-- colorizer setup
-- https://github.com/norcalli/nvim-colorizer.lua#customization
--require('colorizer').setup()


--[[
vim.g.buf_delete = nil
vim.api.nvim_create_augroup("DeleteEmpty", { clear = true })
vim.api.nvim_create_autocmd({"BufHidden"}, {
    group = "DeleteEmpty",
    callback = function(env)
        if env.file == "" then
            vim.g.buf_delete = env.buf
        end
    end
})
vim.api.nvim_create_autocmd({"BufEnter"}, {
    group = "DeleteEmpty",
    callback = function(env)
        if vim.g.buf_delete ~= nil then
            vim.api.nvim_buf_delete(vim.g.buf_delete, {force = true, unload = false})
            print("Deleteing " .. vim.g.buf_delete)
            vim.g.buf_delete = nil
        end
        --for i, v in pairs(vim.g.buf_delete_queue) do
        --    print(i, v)
        --end
        --print(vim.g.buf_queue[vim.g.buf_queue_last - 1])
        --print("last: " .. vim.g.buf_queue_last)
        --vim.g.buf_delete_queue = {}
    end
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

function Dump(o)
    if type(o) == "table" then
        local str = "{"
        local len = TableLength(o)
        local i = 1
        for key, value in pairs(o) do
            str = str .. key .. " = " .. Dump(value)
            if i ~= len then
                str = str .. ", "
            end
            i = i + 1
        end
        return str .. "}"
    else
        return tostring(o)
    end
end

function TableLength(o)
    local len = 0
    for _ in pairs(o) do
        len = len + 1
    end
    return len
end
