vim.g.nvim_tree_side = "left"
vim.g.nvim_tree_width = 35
vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_auto_ignore_ft = {}
vim.g.nvim_tree_quit_on_open = 0
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_root_folder_modifier = ":~"
vim.g.nvim_tree_tab_open = 1
vim.g.nvim_tree_width_allow_resize  = 1
vim.g.nvim_tree_group_empty = 0
vim.g.nvim_tree_disable_window_picker = 1
vim.g.nvim_tree_lsp_diagnostics=0
vim.g.nvim_tree_hijack_cursor = 1
vim.g.nvim_tree_show_icons = { git = 0, folders = 1, files = 1 }

vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = { unstaged = "✗", staged = "✓", unmerged = "", renamed = "➜", untracked = "★" },
    folder = { default = " ", open = " " },
}

-- disable word wrap
vim.cmd("autocmd FileType LuaTree setlocal nowrap")
