local mainMod = "SUPER" -- Sets "Windows" key as main modifier

local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "hyprlauncher"
local browser = "zen"
local editor = "kate"

hl.bind(
    mainMod .. " + A",
    hl.dsp.exec_cmd("qs -c /home/vikram/.config/quickshell ipc call searchapp toggle")
)

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())