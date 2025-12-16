local M = {
    windsurf = {
        "Exafunction/windsurf.vim",
        config = function()
            vim.keymap.set(
                "i",
                "<C-g>",
                function()
                    return vim.fn["codeium#Accept"]()
                end,
                {expr = true, silent = true}
            )
            vim.keymap.set(
                "i",
                "<c-;>",
                function()
                    return vim.fn["codeium#CycleCompletions"](1)
                end,
                {expr = true, silent = true}
            )
            vim.keymap.set(
                "i",
                "<c-,>",
                function()
                    return vim.fn["codeium#CycleCompletions"](-1)
                end,
                {expr = true, silent = true}
            )
            vim.keymap.set(
                "i",
                "<c-x>",
                function()
                    return vim.fn["codeium#Clear"]()
                end,
                {expr = true, silent = true}
            )
        end
    },
    -- Markdown
    markdown = {
        "iamcco/markdown-preview.nvim",
        cmd = {"MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"},
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = {"markdown"}
        end,
        ft = {"markdown"}
    }
}

return {
    M.windsurf,
    M.markdown
}

-- PULLED BY OGKAE
