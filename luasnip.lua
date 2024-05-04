-- snippet example:
-- https://github.com/L3MON4D3/LuaSnip/blob/57c9f5c31b3d712376c704673eac8e948c82e9c1/Examples/snippets.lua#L539C5-L539C5

local ls = require("luasnip")
local snippet       = ls.snippet
local snippet_node  = ls.snippet_node
local text_node     = ls.text_node
local insert_node   = ls.insert_node
local function_node = ls.function_node
local choice_node   = ls.choice_node
local dynamic_node  = ls.dynamic_node
local restore_node  = ls.restore_node

ls.setup({
    update_event = "TextChanged,TextChangedI",
})

require("luasnip.session.snippet_collection").clear_snippets() -- clean previous snippets

require("luasnip.loaders.from_vscode").lazy_load()

ls.add_snippets("java", {
    snippet("System.out.printf", {
        text_node("System.out.printf(\""),
        insert_node(1),
        text_node("\\n\");"),
        insert_node(0),
    }),
    --[[
    snippet("for", {
        text_node("for (int i = 0; i < "),
        insert_node(1),
        text_node({
            "; i++)",
            "{",
            "\t"
        }),
        insert_node(0),
        text_node({
            "",
            "}"
        })
    }),
    snippet("method", {
        insert_node(1, "public"),
        text_node(" "),
        insert_node(2, "void"),
        text_node(" "),
        insert_node(3, "method"),
        text_node("("),
        insert_node(4, "params"),
        text_node({
            ")",
            "{",
            "\t",
        }),
        insert_node(0),
        text_node({
            "",
            "}",
        }),
    }),
    snippet("try/catch", {
        text_node({
            "try",
            "{",
            "\t",
        }),
        insert_node(3),
        text_node({
            "",
            "}",
            "catch (",
        }),
        insert_node(1, "Exception"),
        text_node(" "),
        insert_node(2, "e"),
        text_node({
            ")",
            "{",
            "\t"
        }),
        insert_node(4),
        text_node({
            "",
            "}"
        }),
    }),
    snippet("class", {
        insert_node(1, "public"),
        text_node(" class "),
        insert_node(2, "ClassName"),
        text_node({
            "",
            "{",
            "\t"
        }),
        insert_node(0),
        text_node({
            "",
            "}"
        }),
    }),
    ]]
    snippet("gbc", {
        text_node("GridBagConstraints"),
        insert_node(0),
    }),
    snippet("gbl", {
        text_node("GridBagLayout"),
        insert_node(0),
    }),
    snippet("background_test", {
        insert_node(1, "object"),
        text_node(".setBackground(Color.red);"),
        insert_node(0),
    }),
    snippet("arraylist", {
        text_node("ArrayList<"),
        insert_node(1, "type"),
        text_node("> "),
        insert_node(2, "list"),
        insert_node(3, " = new ArrayList<>();"),
        insert_node(0),
    }),
})

vim.keymap.set({"i", "s", "n", "v"}, "<c-j>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s", "n", "v"}, "<c-k>", function() ls.jump(-1) end, {silent = true})

--vim.api.nvim_create_autocmd({"BufEnter"}, {
--    callback = function()
--        require("luasnip.loaders.from_snipmate").lazy_load()
--    end
--})
