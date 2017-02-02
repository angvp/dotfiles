## Usage

[Read here.](https://github.com/copycat-killer/lain/wiki/Widgets#usage)

### Description

The [asynchronous](https://github.com/copycat-killer/lain/issues/128) version of `base`.

```lua
local myasyncbase = lain.widgets.abase()
```

Configuration is identical to [`base` one](https://github.com/copycat-killer/lain/wiki/base).

## Use case examples

### bitcoin

```lua
-- Bitcoin to USD current price, using Coinbase V1 API
local bitcoin = lain.widgets.abase({
    cmd = "curl -m5 -s 'https://coinbase.com/api/v1/prices/buy'",
    settings = function()
        local btc, pos, err = require("lain.util").dkjson.decode(output, 1, nil)
        local btc_price = (not err and btc and btc["subtotal"]["amount"]) or "N/A"

        -- customize here
        widget:set_text(btc_price)
    end
})
```

### btrfs

```lua
-- btrfs root df
local myrootfs = lain.widgets.abase({
    timeout = 600,
    cmd = "btrfs filesystem df -g /",
    settings  = function()
        local total, used  = string.match(output, "Data.-total=(%d+%.%d+)GiB.-used=(%d+%.%d+)GiB")
        local percent_used = math.ceil((tonumber(used) / tonumber(total)) * 100)

        -- customize here
        widget:set_text(" [/: " .. percent_used .. "%] ")
    end
})
```

### cmus

```lua
-- cmus audio player
local cmus = lain.widgets.abase({
    cmd = "cmus-remote -Q",
    settings = function()
        local cmus_now = {
            state   = "N/A",
            artist  = "N/A",
            title   = "N/A",
            album   = "N/A"
        }

        for w in string.gmatch(output, "(.-)tag") do
            a, b = w:match("(%w+) (.-)\n")
            cmus_now[a] = b
        end

        -- customize here
        widget:set_text(cmus_now.artist .. " - " .. cmus_now.title)
    end
})
```

### maildir

```lua
-- checks whether there are files in the "new" directories of a mail dirtree
local mailpath = "~/Mail"
local mymaildir = lain.widgets.abase({
    timeout = 60,
    cmd = { awful.util.shell, "-c", string.format("ls -1dr %s/*/new/*", mailpath) },
    settings = function()
        local inbox_now = { digest = "" }

        for dir in output:gmatch(".-/(%w+)/new") do
            inbox_now[dir] = 1
            for _ in output:gmatch(dir) do
                inbox_now[dir] = inbox_now[dir] + 1
            end
            if #inbox_now.digest > 0 then inbox_now.digest = inbox_now.digest .. ", " end
            inbox_now.digest = inbox_now.digest .. string.format("%s (%d)", dir, inbox_now[dir])
        end

        -- customize here
        widget:set_text("mail: " .. inbox_now.digest)
    end
})
```

### mpris

```lua
-- infos from mpris clients such as spotify and VLC
-- based on https://github.com/acrisci/playerctl
local mpris = lain.widgets.abase({
    cmd = "playerctl status && playerctl metadata",
    settings = function()
         local escape_f  = require("awful.util").escape
         local mpris_now = {
             state        = "N/A",
             artist       = "N/A",
             title        = "N/A",
             art_url      = "N/A",
             album        = "N/A",
             album_artist = "N/A"
         }

         mpris_now.state = string.match(output, "Playing") or
                           string.match(output, "Paused")  or "N/A"

         for k, v in string.gmatch(output, "'[^:]+:([^']+)':[%s]<%[?'([^']+)'%]?>")
         do
             if     k == "artUrl"      then mpris_now.art_url      = v
             elseif k == "artist"      then mpris_now.artist       = escape_f(v)
             elseif k == "title"       then mpris_now.title        = escape_f(v)
             elseif k == "album"       then mpris_now.album        = escape_f(v)
             elseif k == "albumArtist" then mpris_now.album_artist = escape_f(v)
             end
         end

        -- customize here
        widget:set_text(mpris_now.artist .. " - " .. mpris_now.title)
    end
})
```

### upower

```lua
-- battery infos from freedesktop upower
local mybattery = lain.widgets.abase({
    timeout = 30,
    cmd = "upower -i /org/freedesktop/UPower/devices/battery_BAT | sed -n '/present/,/icon-name/p'",
    settings = function()
        local bat_now = {
            present      = "N/A",
            state        = "N/A",
            warninglevel = "N/A",
            energy       = "N/A",
            energyfull   = "N/A",
            energyrate   = "N/A",
            voltage      = "N/A",
            percentage   = "N/A",
            capacity     = "N/A",
            icon         = "N/A"
        }

        for k, v in string.gmatch(output, '([%a]+[%a|-]+):%s*([%a|%d]+[,|%a|%d]-)') do
            if     k == "present"       then bat_now.present      = v
            elseif k == "state"         then bat_now.state        = v
            elseif k == "warning-level" then bat_now.warninglevel = v
            elseif k == "energy"        then bat_now.energy       = string.gsub(v, ",", ".") -- Wh
            elseif k == "energy-full"   then bat_now.energyfull   = string.gsub(v, ",", ".") -- Wh
            elseif k == "energy-rate"   then bat_now.energyrate   = string.gsub(v, ",", ".") -- W
            elseif k == "voltage"       then bat_now.voltage      = string.gsub(v, ",", ".") -- V
            elseif k == "percentage"    then bat_now.percentage   = tonumber(v)              -- %
            elseif k == "capacity"      then bat_now.capacity     = string.gsub(v, ",", ".") -- %
            elseif k == "icon-name"     then bat_now.icon         = v
            end
        end

        -- customize here
        widget:set_text("Bat: " .. bat_now.percentage .. " " .. bat_now.state)
    end
})
```