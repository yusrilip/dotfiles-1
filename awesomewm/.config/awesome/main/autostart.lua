local awful = require("awful")

do
    local cmds = {
        "/usr/lib/mate-polkit/polkit-mate-authentication-agent-1",
        "xautolock -time 15 -detectsleep -locker 'gpg-connect-agent reloadagent /bye';slimlock",
        "clipmenud",
        "xfce4-power-manager",
        "light -S 30",
        "udiskie",
    }

    for _, i in pairs(cmds) do
        awful.spawn.with_shell(i .. "&")
    end
end
