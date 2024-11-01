local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")


ls.add_snippets("python", {
    s("doc", {
        t('"""'),  -- Opening triple quotes
        t({"", ""}),  -- Newline after input
        t({"Module: "}),
        f(function()
            return vim.fn.expand("%:t")  -- Inserts current file name
        end),
        t({"", ""}),  -- Newline after input
        t({"Support by: "}), i(1, "Your Name"),  -- Input for author
        t({"", ""}),  -- Newline after input
        t({"Version: "}), i(2, "0.01"),  -- Input for version
        t({"", ""}),  -- Newline after input
        t({"Date: "}), i(3, os.date("%Y-%m-%d")),  -- Input for date with default current date
        t({"", ""}),  -- Newline after input
        t({"Description: "}), i(4, "Describe the purpose of the module"),  -- Input for purpose
        t({"", ""}),  -- Empty lines after inputs
        t("Status: "),  -- Static text
        c(5, {  -- Choice node
            t("STUDY"),
            t("DEV"),
            t("PROD")}),
        t({"", ""}),  -- Newline after input
        t('"""')  -- Closing triple quotes
    }),
})

ls.add_snippets("all", {
    s("cur_time", {
        t(os.date("%Y-%m-%d %H:%M:%S"))
    }),
})

return {}
