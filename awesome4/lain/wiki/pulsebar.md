## Usage

[Read here.](https://github.com/copycat-killer/lain/wiki/Widgets#usage)

### Description

Shows PulseAudio volume with a progressbar; provides tooltips and notifications.

```lua
local volume = lain.widgets.pulsebar()
```

## Input table

Variable | Meaning | Type | Default
--- | --- | --- | ---
`timeout` | Refresh timeout seconds | int | 5
`settings` | User settings | function | empty function
`width` | Bar width | int | 63
`height` | Bar height | int | 1
`ticks` | Set bar ticks on | boolean | false
`ticks_size` | Ticks size | int | 7
`vertical` | Set the bar vertical | boolean | false
`cmd` | PulseAudio command | string | same as [here](https://github.com/copycat-killer/lain/wiki/pulseaudio)
`scallback` | [PulseAudio sink callback](https://github.com/copycat-killer/lain/wiki/pulseaudio/) | function | `nil`
`sink` | Mixer sink | int | 0
`colors` | Bar colors | table | see [Default colors](https://github.com/copycat-killer/lain/wiki/pulsebar#default-colors)
`notification_preset` | Notifications settings | table | [`naughty.config.defaults`](https://awesomewm.org/apidoc/libraries/naughty.html#config.defaults)
`followtag` | Display the notification on currently focused screen | boolean | false

`settings` can use [these variables](https://github.com/copycat-killer/lain/wiki/pulseaudio#settings-variables).

### Default colors

Variable | Meaning | Type | Default
--- | --- | --- | ---
`background` | Bar backgrund color | string | "#000000"
`mute` | Bar mute color | string | "#EB8F8F"
`unmute` | Bar unmute color | string | "#A4CE8A"

## Output table

Variable | Meaning | Type
--- | --- | ---
`bar` | The widget | `wibox.widget.progressbar`
`sink` | PulseAudio sink | string
`notify` | The notification | function
`update` | Update state | function

In multiple screen setups, the default behaviour is to show a visual notification pop-up window on the first screen. By setting `followtag` to `true` it will be shown on the currently focused tag screen.

## Keybindings

Read [here](https://github.com/copycat-killer/lain/wiki/pulseaudio#keybindings). If you want notifications, use `volume.notify()` instead of `volume.update()`.