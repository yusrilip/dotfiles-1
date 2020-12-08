local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local colorize = require("main.helpers").colorize
local markup = require("main.helpers").markup
local icon = os.getenv("HOME") .. "/.config/awesome/statusbar/modules/memory/icon.svg"

local M = {}

-- Memory
M.icon = wibox.widget.imagebox(colorize(icon, beautiful.widget_icon))

local get_mem_status = [[
    sh -c "
    free -h | awk '/^Mem/ { print $3 }' | sed s/i//g
    "
]]

M.widget = awful.widget.watch(get_mem_status, 5, function(widget, stdout)
        widget:set_markup(markup(stdout, {fg = beautiful.widget_text}))
    end)

return M
