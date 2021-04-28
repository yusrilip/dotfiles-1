local function hl(group, options)
    local bg = options.bg == nil and "" or "guibg=" .. options.bg
    local fg = options.fg == nil and "" or "guifg=" .. options.fg
    local gui = options.gui == nil and "" or "gui=" .. options.gui

    vim.cmd(string.format("hi %s %s %s %s", group, bg, fg, gui))
end

function _G.applyGruvbox()
    local highlights = {
        -- normal stuff
        { "Normal", { bg = "NONE" } },
        { "SignColumn", { bg = "NONE" } },
        { "ColorColumn", { bg = "NONE", fg = "#928374" } },
        { "IncSearch", { bg = "#928374", fg = "#282828", gui = "bold" } },
        { "VertSplit", { bg = "#282828", fg = "#282828" } },

        -- statusline colours
        { "StatusLine", { bg = "#282828", fg = "#282828" } },
        { "StatusLineNC", { bg = "#282821", fg = "#282821" } },

        -- luatree
        { "NvimTreeFolderIcon", { fg = "#D79921" } },
        { "NvimTreeIndentMarker", { fg = "#928374" } },

        -- telescope
        { "TelescopeSelection", { bg = "NONE", fg = "#D79921", gui = "bold" } },
        { "TelescopeMatching", { bg = "NONE", fg = "#D79921", gui = "bold" } },
        { "TelescopePreviewBorder", { bg = "NONE", fg = "#928374", gui = "bold" } },
        { "TelescopePromptBorder", { bg = "NONE", fg = "#928374", gui = "bold" } },
        { "TelescopeResultsBorder", { bg = "NONE", fg = "#928374", gui = "bold" } },
        { "TelescopePromptPrefix", { bg = "NONE", fg = "#D79921" } },

        -- diagnostic-nvim
        { "LspDiagnosticsDefaultError", { bg = "NONE", fg = "#FB4934" } },
        { "LspDiagnosticsDefaultInformation", { bg = "NONE", fg = "#D3869B" } },
        { "LspDiagnosticsDefaultWarning", { bg = "NONE", fg = "#FABD2F" } },
        { "LspDiagnosticsDefaultHint", { bg = "NONE", fg = "#83A598" } },

        -- barbar
        { "BufferCurrent", { bg = "NONE", fg = "#EBDBB2", gui = "bold" } },
        { "BufferCurrentMod", { bg = "NONE", fg = "#EBDBB2" } },
        { "BufferCurrentSign", { bg = "NONE", fg = "#EBDBB2" } },
        { "BufferCurrentTarget", { bg = "NONE", fg = "#EBDBB2" } },
        { "BufferVisible", { bg = "NONE", fg = "#EBDBB2" } },
        { "BufferVisibleMod", { bg = "NONE", fg = "#EBDBB2" } },
        { "BufferVisibleSign", { bg = "NONE", fg = "#EBDBB2" } },
        { "BufferVisibleTarget", { bg = "NONE", fg = "#EBDBB2" } },
        { "BufferInactive", { bg = "NONE", fg = "#928374" } },
        { "BufferInactiveMod", { bg = "NONE", fg = "#928374" } },
        { "BufferInactiveSign", { bg = "NONE", fg = "#928374" } },
        { "BufferInactiveTarget", { bg = "NONE", fg = "#928374" } },
        { "BufferTabpages", { bg = "NONE", fg = "#EBDBB2" } },
        { "BufferTabpageFill", { bg = "NONE", fg = "#EBDBB2" } },

        -- lspsaga
        { "LspFloatWinBorder", { bg = "NONE", fg = "#928374" } },
        { "LspSagaRenameBorder", { bg = "NONE", fg = "#928374" } },
        { "LspSagaHoverBorder", { bg = "NONE", fg = "#928374" } },
        { "LspSagaSignatureHelpBorder", { bg = "NONE", fg = "#928374" } },
        { "LspSagaCodeActionBorder", { bg = "NONE", fg = "#928374" } },
        { "LspSagaDefPreviewBorder", { bg = "NONE", fg = "#928374" } },
        { "LspLinesDiagBorder", { bg = "NONE", fg = "#928374" } },

        -- vim-translator
        { "TranslatorBorder", { bg = "NONE", fg = "#928374" } },

        -- gitsigns
        { "GitSignAdd", { bg = "NONE", fg = "#458588" } },
        { "GitSignChange", { bg = "NONE", fg = "#D79921" } },
        { "GitSignDelete", { bg = "NONE", fg = "#928374" } },

        -- nvim-biscuits
        { "BiscuitColor", { bg = "NONE", fg = "#3c3836" } },
    }

    for _, highlight in pairs(highlights) do
        hl(highlight[1], highlight[2])
    end
end

-- italicize comments
hl("Comment", { gui = "italic" })

-- automatically override colorscheme
vim.api.nvim_exec(
    [[
augroup NewColor
au!
au ColorScheme gruvbox8 call v:lua.applyGruvbox()
augroup END
colorscheme gruvbox8
]],
    false
)
