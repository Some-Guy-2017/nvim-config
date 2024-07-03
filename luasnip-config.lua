-- snippet example:
-- https://github.com/L3MON4D3/LuaSnip/blob/57c9f5c31b3d712376c704673eac8e948c82e9c1/Examples/snippets.lua#L539C5-L539C5

local ls = require("luasnip")
local snippet       = ls.snippet
local snippet_node  = ls.snippet_node
local text_node     = ls.text_node
local insert_node   = ls.insert_node
local repeat_node   = require("luasnip.extras").rep
--local formata_node = require("luasnip.extras.fmt").fmta
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
    -- System.out.printf("{1}\n"{2});{0}
    snippet("printf", {
        text_node('System.out.printf("'),
        insert_node(1),
        text_node('\\n"'),
        insert_node(2),
        text_node(");"),
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
    snippet("set_constructor_parameter", {
        text_node("this."),
        insert_node(1, "parameter"),
        text_node(" = "),
        repeat_node(1),
        text_node(";"),
        insert_node(0),
    }),

    --[[
        class {1:Class}Test extends Test {
            {2}
            public {1}Test(String testName{3}) {
                super("{4}", testName);{5}
            }

            void execute() {
                {6}
            }
        }{0}
    --]]
    snippet("test_class", {
        text_node("class "),
        insert_node(1, "Class"),
        text_node({
            "Test extends Test {",
            "    ",
        }),
        insert_node(2),
        text_node({
            "    ",
            "    public ",
        }),
        repeat_node(1),
        text_node("Test(String testName"),
        insert_node(3),
        text_node({
            ") {",
            "        super(\"",
        }),
        insert_node(4, "Class Name"),
        text_node(" Test\", testName);"),
        insert_node(5),
        text_node({
            "",
            "    }",
            "    ",
            "    void execute() {",
            "        ",
        }),
        insert_node(6),
        text_node({
            "",
            "    }",
            "}",
        }),
        insert_node(0);
    }),

    --[[
        {1:var}=" + {1} + ", {0}
    --]]
    snippet("print_var", {
        insert_node(1, "var"),
        text_node("=\" + "),
        repeat_node(1),
        text_node(" + \", "),
        repeat_node(0),
    }),

    --[[
        assert {1} == {2} : "Expected " + {1} + " but received " + {2} + ".";{0}
    --]]
    snippet("basic_expected_assert", {
        text_node("assert "),
        insert_node(1, "expected_value"),
        text_node(" == "),
        insert_node(2, "received_value"),
        text_node(" : \"Expected \" + "),
        repeat_node(1),
        text_node(" + \", but received \" + "),
        repeat_node(2),
        text_node(" + \".\";"),
        repeat_node(0),
    }),
    
    --[[
        assert {1}.equals({2}) : "Expected " + {1} + " but received " + {2} + ".";{0}
    --]]
    snippet("object_expected_assert", {
        text_node("assert "),
        insert_node(1, "expected_value"),
        text_node(".equals("),
        insert_node(2, "received_value"),
        text_node(") : \"Expected \" + "),
        repeat_node(1),
        text_node(" + \", but received \" + "),
        repeat_node(2),
        text_node(" + \".\";"),
        repeat_node(0),
    }),

    -- "Expected " + {1} + " but received " + {2} + ".";{0}
    snippet("expected", {
        text_node("\"Expected \" + "),
        insert_node(1, "expected_value"),
        text_node(" + \", but received \" + "),
        insert_node(2, "received_value"),
        text_node(" + \".\";"),
        insert_node(0),
    }),

    -- ArrayList<Flashcard> {2:flashcards} = {0}
    snippet("flashcard_arraylist", {
        text_node("ArrayList<Flashcard> "),
        insert_node(1, "flashcards"),
        text_node(" = "),
        insert_node(0),
    }),
})
ls.add_snippets("pseudocode" , {
    snippet("START", {
        text_node("START "),
        insert_node(1, "functionName"),
        text_node("("),
        insert_node(2, "params"),
        text_node({
            ")",
            "\t",
        }),
        insert_node(0),
        text_node({
            "",
            "END",
        }),
    }),
})
ls.add_snippets("tex", {
    snippet("bounds", {
        text_node("$"),
        insert_node(1, "D/R"),
        text_node(":\\{"),
        insert_node(2, "x/y"),
        text_node("|"),
        insert_node(3, "precondition"),
        repeat_node(2),
        insert_node(4, "postcondition"),
        text_node(", "),
        repeat_node(2),
        text_node(" \\in \\mathbb{"),
        insert_node(5, "R"),
        text_node("}\\}$"),
        insert_node(0),
    }),
    snippet("vec", {
        text_node("\\vec{"),
        insert_node(1),
        text_node("}_"),
        insert_node(2),
        insert_node(0),
    }),
    snippet("fvec", {
        text_node("\\vec{F}_"),
        insert_node(2),
        insert_node(0),
    }),
    snippet("outline-math", {
        text_node("\\[ "),
        insert_node(1),
        text_node(" \\]"),
        insert_node(0),
    }),
    snippet("quotient", {
        text_node("\\frac{ "),
        insert_node(1),
        text_node(" }{ "),
        insert_node(2),
        text_node(" }"),
        insert_node(0),
    })
})

ls.add_snippets("xml", {
    
    --[[
        <{1:tag}>
            {2}
        </{1}>{0}
    --]]
    snippet("tag", {
        text_node("<"),
        insert_node(1, "tag"),
        text_node({
            ">",
            "    ",
        }),
        insert_node(2),
        text_node({
            "",
            "</",
        }),
        repeat_node(1),
        text_node(">"),
        insert_node(0),
    }),
    
    --[[
        <pair>
            {1}
        </pair>{0}
    --]]
    snippet("pair", {
        text_node({
            "<pair>",
            "    ",
        }),
        insert_node(1),
        text_node({
            "",
            "</pair>",
        }),
        insert_node(0),
    }),
    --[[
        <txt>
        {1}
        </txt>{0}
    --]]
    snippet("txt", {
        text_node({
            "<txt>",
            "",
        }),
        insert_node(1),
        text_node({
            "",
            "</txt>",
        }),
        insert_node(0),
    }),
    
    -- <img src="{1}"{2}/>{0}
    snippet("img", {
        text_node("<img src=\""),
        insert_node(1),
        text_node("\""),
        insert_node(2),
        text_node("/>"),
        insert_node(0),
    }),
})

ls.add_snippets("all", {
    snippet("lorem", {
        text_node({
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "Fusce imperdiet in arcu maximus lacinia.",
            "Cras tincidunt, dolor quis efficitur euismod, dolor libero placerat lacus, eget facilisis lectus erat nec turpis.",
            "Quisque vitae vehicula lectus.",
            "Donec rutrum arcu sed ex lacinia, at accumsan ex tempus.",
            "Donec in ante accumsan, laoreet justo lacinia, tincidunt ipsum.",
            "Nam facilisis mollis nisl, quis fringilla odio aliquet nec.",
            "Donec ex purus, posuere ac commodo sit amet, porttitor sed nunc.",
            "Pellentesque sed augue sit amet nisi gravida vehicula.",
        }),
    })
})

vim.keymap.set({"i", "s", "n", "v"}, "<c-j>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s", "n", "v"}, "<c-k>", function() ls.jump(-1) end, {silent = true})

--vim.api.nvim_create_autocmd({"BufEnter"}, {
--    callback = function()
--        require("luasnip.loaders.from_snipmate").lazy_load()
--    end
--})
