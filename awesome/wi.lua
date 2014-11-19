-----------------------
-- AwesomeWM widgets --
--      3.5-rc1      --
--   <tdy@gmx.com>   --
-----------------------

local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local vicious = require("vicious")
local naughty = require("naughty")

graphwidth  = 120
graphheight = 20
pctwidth    = 40
netwidth    = 50
-- mpdwidth    = 365

-- {{{ SPACERS
space = wibox.widget.textbox()
space:set_text(" ")

comma = wibox.widget.textbox()
comma:set_markup(",")

pipe = wibox.widget.textbox()
pipe:set_markup("<span color='" .. beautiful.bg_em .. "'>|</span>")

tab = wibox.widget.textbox()
tab:set_text("         ")

volspace = wibox.widget.textbox()
volspace:set_text(" ")
-- }}}

-- Cache
vicious.cache(vicious.widgets.cpu)
vicious.cache(vicious.widgets.cpuinf)

-- {{{ MEMORY
-- Cache
vicious.cache(vicious.widgets.mem)

-- Ram used
memused = wibox.widget.textbox()
vicious.register(memused, vicious.widgets.mem,
  "<span color='" .. beautiful.fg_em .. "'>ram</span>$2MB", 5)

-- Ram bar
membar = awful.widget.progressbar()
membar:set_vertical(false):set_width(graphwidth):set_height(graphheight)
membar:set_ticks(false):set_ticks_size(2)
membar:set_border_color(nil)
membar:set_background_color(beautiful.bg_widget)
membar:set_color({
  type = "linear",
  from = { 0, 0 },
  to = { graphwidth, 0 },
  stops = {
    { 0, beautiful.fg_widget },
    { 0.25, beautiful.fg_center_widget },
    { 1, beautiful.fg_end_widget }
  }})
vicious.register(membar, vicious.widgets.mem, "$1", 13)

-- Ram %
mempct = wibox.widget.textbox()
mempct.width = pctwidth
vicious.register(mempct, vicious.widgets.mem, "$1%", 5)

-- Cache
vicious.cache(vicious.widgets.fs)

-- Root used
rootfsused = wibox.widget.textbox()
vicious.register(rootfsused, vicious.widgets.fs,
  "<span color='" .. beautiful.fg_em .. "'>ssd</span>${/ used_gb}GB", 97)

-- Root bar
rootfsbar = awful.widget.progressbar()
rootfsbar:set_vertical(false):set_width(graphwidth):set_height(graphheight)
rootfsbar:set_ticks(false):set_ticks_size(2)
rootfsbar:set_border_color(nil)
rootfsbar:set_background_color(beautiful.bg_widget)
rootfsbar:set_color({
  type = "linear",
  from = { 0, 0 },
  to = { graphwidth, 0 },
  stops = {
    { 0, beautiful.fg_widget },
    { 0.25, beautiful.fg_center_widget },
    { 1, beautiful.fg_end_widget }
  }})
vicious.register(rootfsbar, vicious.widgets.fs, "${/ used_p}", 97)

-- Root %
rootfspct = wibox.widget.textbox()
rootfspct.width = pctwidth
vicious.register(rootfspct, vicious.widgets.fs, "${/ used_p}%", 97)
-- }}}

-- {{{ NETWORK
-- Cache
vicious.cache(vicious.widgets.net)

-- Up graph
upgraph = awful.widget.graph()
upgraph:set_width(graphwidth):set_height(graphheight)
upgraph:set_border_color(nil)
upgraph:set_background_color(beautiful.bg_widget)
upgraph:set_color({
  type = "linear",
  from = { 0, graphheight },
  to = { 0, 0 },
  stops = {
    { 0, beautiful.fg_widget },
    { 0.25, beautiful.fg_center_widget },
    { 1, beautiful.fg_end_widget }
  }})
vicious.register(upgraph, vicious.widgets.net, "${eth0 up_kb}")

-- TX
txwidget = wibox.widget.textbox()
vicious.register(txwidget, vicious.widgets.net,
  "<span color='" .. beautiful.fg_em .. "'>up</span>${eth0 tx_mb}MB", 19)

-- Up speed
upwidget = wibox.widget.textbox()
upwidget.fit = function(box,w,h)
  local w,h = wibox.widget.textbox.fit(box,w,h) return math.max(netwidth,w),h
end
vicious.register(upwidget, vicious.widgets.net, "${eth0 up_kb}", 2)

-- Down graph
downgraph = awful.widget.graph()
downgraph:set_width(graphwidth):set_height(graphheight)
downgraph:set_border_color(nil)
downgraph:set_background_color(beautiful.bg_widget)
downgraph:set_color({
  type = "linear",
  from = { 0, graphheight },
  to = { 0, 0 },
  stops = {
    { 0, beautiful.fg_widget },
    { 0.25, beautiful.fg_center_widget },
    { 1, beautiful.fg_end_widget }
  }})
vicious.register(downgraph, vicious.widgets.net, "${eth0 down_kb}")

-- RX
rxwidget = wibox.widget.textbox()
vicious.register(rxwidget, vicious.widgets.net,
  "<span color='" .. beautiful.fg_em .. "'>down</span>${eth0 rx_mb}MB", 17)

-- Down speed
downwidget = wibox.widget.textbox()
downwidget.fit = function(box,w,h)
  local w,h = wibox.widget.textbox.fit(box,w,h) return math.max(netwidth,w),h
end
vicious.register(downwidget, vicious.widgets.net, "${eth0 down_kb}", 2)
-- }}}

-- {{{ WEATHER
weather = wibox.widget.textbox()
vicious.register(weather, vicious.widgets.weather,
  "<span color='" .. beautiful.fg_em .. "'>${sky}</span> @ ${tempc}°C on",
  8113, "SABE")
weather:buttons(awful.util.table.join(awful.button({ }, 1, function()
  vicious.force({ weather })
end)))


-- {{{ VOLUME
-- Cache
vicious.cache(vicious.widgets.volume)

-- Icon
volicon = wibox.widget.imagebox()
volicon:set_image(beautiful.widget_vol)

-- Volume %
volpct = wibox.widget.textbox()
vicious.register(volpct, vicious.widgets.volume, "$1%", nil, "Master")

-- Buttons
volicon:buttons(awful.util.table.join(
  awful.button({ }, 1,
    function() awful.util.spawn_with_shell("amixer -q set Master toggle") end),
  awful.button({ }, 4,
    function() awful.util.spawn_with_shell("amixer -q set Master 3+% unmute") end),
  awful.button({ }, 5,
    function() awful.util.spawn_with_shell("amixer -q set Master 3-% unmute") end)
))
volpct:buttons(volicon:buttons())
volspace:buttons(volicon:buttons())
-- }}}

-- {{{ BATTERY
-- Battery attributes
local bat_state  = ""
local bat_charge = 0
local bat_time   = 0
local blink      = true

-- Icon
baticon = wibox.widget.imagebox()
baticon:set_image(beautiful.widget_batfull)

-- Charge %
batpct = wibox.widget.textbox()
vicious.register(batpct, vicious.widgets.bat, function(widget, args)
  bat_state  = args[1]
  bat_charge = args[2]
  bat_time   = args[3]

  if args[1] == "-" then
    if bat_charge > 70 then
      baticon:set_image(beautiful.widget_batfull)
    elseif bat_charge > 30 then
      baticon:set_image(beautiful.widget_batmed)
    elseif bat_charge > 10 then
      baticon:set_image(beautiful.widget_batlow)
    else
      baticon:set_image(beautiful.widget_batempty)
    end
  end
  if args[1] == "+" then 
    baticon:set_image(beautiful.widget_ac)
    if args[1] == "+" then
      blink = not blink
      if blink then
        baticon:set_image(beautiful.widget_acblink)
      end
    end
  end

  return args[2] .. "%"
end, nil, "BAT0")

-- Buttons
function popup_bat()
  local state = ""
  if bat_state == "↯" then
    state = "Full"
  elseif bat_state == "↯" then
    state = "Charged"
  elseif bat_state == "+" then
    state = "Charging"
  elseif bat_state == "-" then
    state = "Discharging"
  elseif bat_state == "⌁" then
    state = "Not charging"
  else
    state = "Unknown"
  end

  naughty.notify { text = "Charge : " .. bat_charge .. "%\nState  : " .. state ..
    " (" .. bat_time .. ")", timeout = 5, hover_timeout = 0.5 }
end
batpct:buttons(awful.util.table.join(awful.button({ }, 1, popup_bat)))
baticon:buttons(batpct:buttons())
-- }}}
--


