-----------------------
--  AwesomeWM theme  --
-- based on Dust GTK --
--   <tdy@gmx.com>   --
-----------------------

local awful = require("awful")

local basedir = awful.util.getdir('config')

-- {{{ Main
theme = {}
-- theme.wallpaper = basedir .. "/themes/dust/Galaxy3.jpg"
theme.font = "Monaco 12"
-- }}}

-- {{{ Colors
theme.fg_normal = "#aaaaaa"
theme.fg_focus = "#111111"
theme.fg_urgent = "#ffffff"
theme.fg_tooltip = "#1a1a1a"
theme.fg_em = "#d6d6d6"

theme.bg_normal = "#1a1a1a"
theme.bg_focus = "#908884"
theme.bg_urgent = "#cd7171"
theme.bg_tooltip = "#d6d6d6"
theme.bg_em = "#5a5a5a"
theme.bg_systray = theme.bg_normal

theme.fg_widget = "#908884"
theme.fg_center_widget = "#636363"
theme.fg_end_widget = "#1a1a1a"
theme.bg_widget = "#2a2a2a"
theme.border_widget = "#3F3F3F"
-- }}}

-- {{{ Borders
theme.border_width = 1
theme.border_normal = "#222222"
theme.border_focus = "#908884"
theme.border_marked = "#91231c"
theme.border_tooltip = "#444444"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
theme.menu_height = 15
theme.menu_width = 100
-- }}}

-- {{{ Taglist
theme.taglist_squares_sel = basedir .. "/themes/dust/taglist/squaref.png"
theme.taglist_squares_unsel = basedir .. "/themes/dust/taglist/square.png"
-- }}}

-- {{{ Misc
theme.awesome_icon = basedir .. "/themes/dust/awesome-dust22.png"
theme.menu_submenu_icon = "/usr/share/awesome/themes/default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile = basedir .. "/themes/dust/layouts/tilew.png"
theme.layout_tileleft = basedir .. "/themes/dust/layouts/tileleftw.png"
theme.layout_tilebottom = basedir .. "/themes/dust/layouts/tilebottomw.png"
theme.layout_tiletop = basedir .. "/themes/dust/layouts/tiletopw.png"
theme.layout_fairv = basedir .. "/themes/dust/layouts/fairvw.png"
theme.layout_fairh = basedir .. "/themes/dust/layouts/fairhw.png"
theme.layout_spiral = basedir .. "/themes/dust/layouts/spiralw.png"
theme.layout_dwindle = basedir .. "/themes/dust/layouts/dwindlew.png"
theme.layout_max = basedir .. "/themes/dust/layouts/maxw.png"
theme.layout_fullscreen = basedir .. "/themes/dust/layouts/fullscreenw.png"
theme.layout_magnifier = basedir .. "/themes/dust/layouts/magnifierw.png"
theme.layout_floating = basedir .. "/themes/dust/layouts/floatingw.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus = "/usr/share/awesome/themes/default/titlebar/close_focus.png"
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/default/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active = "/usr/share/awesome/themes/default/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive = "/usr/share/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active = "/usr/share/awesome/themes/default/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive = "/usr/share/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active = "/usr/share/awesome/themes/default/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive = "/usr/share/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active = "/usr/share/awesome/themes/default/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_normal_inactive.png"
-- }}}

-- {{{ Widgets
theme.widget_disk = basedir .. "/themes/dust/widgets/disk.png"
theme.widget_cpu = basedir .. "/themes/dust/widgets/cpu.png"
theme.widget_ac = basedir .. "/themes/dust/widgets/ac.png"
theme.widget_acblink = basedir .. "/themes/dust/widgets/acblink.png"
theme.widget_blank = basedir .. "/themes/dust/widgets/blank.png"
theme.widget_batfull = basedir .. "/themes/dust/widgets/batfull.png"
theme.widget_batmed = basedir .. "/themes/dust/widgets/batmed.png"
theme.widget_batlow = basedir .. "/themes/dust/widgets/batlow.png"
theme.widget_batempty = basedir .. "/themes/dust/widgets/batempty.png"
theme.widget_vol = basedir .. "/themes/dust/widgets/vol.png"
theme.widget_mute = basedir .. "/themes/dust/widgets/mute.png"
theme.widget_pac = basedir .. "/themes/dust/widgets/pac.png"
theme.widget_pacnew = basedir .. "/themes/dust/widgets/pacnew.png"
theme.widget_mail = basedir .. "/themes/dust/widgets/mail.png"
theme.widget_mailnew = basedir .. "/themes/dust/widgets/mailnew.png"
theme.widget_temp = basedir .. "/themes/dust/widgets/temp.png"
theme.widget_tempwarn = basedir .. "/themes/dust/widgets/tempwarm.png"
theme.widget_temphot = basedir .. "/themes/dust/widgets/temphot.png"
theme.widget_wifi = basedir .. "/themes/dust/widgets/wifi.png"
theme.widget_nowifi = basedir .. "/themes/dust/widgets/nowifi.png"
theme.widget_mpd = basedir .. "/themes/dust/widgets/mpd.png"
theme.widget_play = basedir .. "/themes/dust/widgets/play.png"
theme.widget_pause = basedir .. "/themes/dust/widgets/pause.png"
theme.widget_ram = basedir .. "/themes/dust/widgets/ram.png"

theme.widget_mem = basedir .. "/themes/dust/tp/ram.png"
theme.widget_swap = basedir .. "/themes/dust/tp/swap.png"
theme.widget_fs = basedir .. "/themes/dust/tp/fs_01.png"
theme.widget_fs2 = basedir .. "/themes/dust/tp/fs_02.png"
theme.widget_up = basedir .. "/themes/dust/tp/up.png"
theme.widget_down = basedir .. "/themes/dust/tp/down.png"
-- }}}

return theme
