## Usage

[Read here.](https://github.com/copycat-killer/lain/wiki/Widgets#usage)

### Description

Attaches a calendar notification to a widget.

```lua
local calendar = lain.widgets.calendar()
```

- Left click / scroll down: switch to previous month.
- Right click / scroll up: switch to next month.

## Input table

Variable | Meaning | Type | Default
--- | --- | --- | ---
`cal` | custom call for `cal` | string | "/usr/bin/cal --color=always"
`attach_to` | Array of widgets | array | empty array
`followtag` | Display the notification on currently focused screen | boolean | false
`icons` | Path to calendar icons | string | [lain/icons/cal/white](https://github.com/copycat-killer/lain/tree/master)
`notification_preset` | Notification preset | table | [`naughty.config.defaults`](https://awesomewm.org/apidoc/libraries/naughty.html#config.defaults)

You can reset `cal` any way you like (using `-w` to display weeks as well, for instance), but **be always sure to have the flag `--color=always`**, otherwise the highlighting (which is basically an exploit of `cal`) will not work.

You can set `attach_to` as the array of widgets to which you want to attach the calendar, for instance: `attach_to = { mytextclock }`, or `attach_to = { mytextclock, myotherwidget, ... }`.

The notification will show an icon of the current day number, and output from ``cal`` with current day highlighted.

In multiple screen setups, the default behaviour is to show a visual notification pop-up window on the first screen. By setting `followtag` to `true` it will be shown on the currently focused tag screen.

## Output table

Variable | Meaning | Type
--- | --- | ---
`attach` | Attach the calendar to an input widget | function
`show` | Show calendar | function
`hide` | Hide calendar | function

`attach` takes as argument the widget you want to attach the calendar to: `calendar.attach(widget)`.

## Keybindings

You can call the notification with a key binding like this:

```lua
awful.key({ altkey }, "c", function ()
    calendar:show(7)
end),
```

where ``altkey = "Mod1"`` and ``show`` argument is an optional integer, meaning timeout seconds.

You can also call it defining a notification screen with a third argument like this:

```lua
awful.key({ altkey }, "c", function ()
    calendar:show(7, 0, my_scr_number)
end),
```

## Note

Naughty notifications require `notification_preset.font` to be **monospaced**, in order to correctly display the output.