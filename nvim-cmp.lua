local cmp = require('cmp')

local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        -- specify snippet engine
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<c-c>'] = cmp.mapping.abort(),
        ['<m-y>'] = cmp.mapping.confirm({
            select = true, -- accept currently selected item
            behavior = cmp.ConfirmBehavior.Replace, -- replace the text, don't leave it (versus ConfirmBehavior.Insert)
        }),
        ['<tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            --elseif luasnip.expand_or_jumpable() then
            --    luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<s-tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            --elseif luasnip.jumpable(-1) then
            --    luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            {
                name = 'tags',
                option = {
                    complete_defer = 0, -- no delay after user input
                    max_items = 10,
                    keyword_length = 2,
                }
            },
        }, {
            { name = 'buffer' },
        }
    )
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
         { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
            { name = 'path', },
            { name = 'bash', },
            {
                name = 'cmdline',
                option = {
                    ignore_cmds = { 'Man', '!' }
                }
            },
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})
