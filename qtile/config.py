from libqtile.manager import Key, Screen, Group, Click, Drag
from libqtile.command import lazy
from libqtile.layout.base import Layout
from libqtile import layout, bar, widget, hook
from libqtile.layout.xmonad import MonadTall

modkey = "mod4"

keys = [
    # application shortcuts
    Key([modkey, "shift"], "p", lazy.spawn("gmrun &")),
    Key([modkey, "shift"], "Return", lazy.spawn("gnome-terminal")),

    # high-level management
    Key([modkey], "space", lazy.nextlayout()), # cycle layouts
    Key([modkey], "t", lazy.window.disable_floating()), # embed float
    Key([modkey, "shift"], "t", lazy.window.enable_floating()), # pop tile
    Key([modkey, "shift"], "q", lazy.window.kill()), # kill window
    Key([modkey, "shift"], "r", lazy.restart()), # restart qtile
    Key([modkey, "shift"], "l", lazy.shutdown()), # kill qtile

    # layout controls
    Key([modkey], "k", lazy.layout.down()), # focus left
    Key([modkey], "j", lazy.layout.up()), # focus right
    Key([modkey, "shift"], "k", lazy.layout.shuffle_down()), # move tile left
    Key([modkey, "shift"], "j", lazy.layout.shuffle_up()), # move tile right
    Key([modkey], "i", lazy.layout.grow()), # increase tile size
    Key([modkey], "m", lazy.layout.shrink()), # decrease tile size
    Key([modkey], "n", lazy.layout.normalize()), # equalize tiles
    Key([modkey], "o", lazy.layout.maximize()), # maximize tile
    Key([modkey, "shift"], "space", lazy.layout.flip()), # flip orientation
]

mouse = [
    # pop tile
    Drag([modkey], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    # resize float
    Drag([modkey], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    # show float
    Click([modkey], "Button2", lazy.window.bring_to_front()),
]

# Ten virtual-workspaces
# Each available on the left home and under rows
groups = [
    Group("a"), Group("s"), Group("d"), Group("f"), Group("g"),
    Group("z"), Group("x"), Group("c"), Group("v"), Group("b"),
]
for i in groups:
    # switch to group
    keys.append(
        Key([modkey], i.name, lazy.group[i.name].toscreen())
    )
    # move tile to group
    keys.append(
        Key([modkey, "shift"], i.name, lazy.window.togroup(i.name))
    )


# Two simple layout instances:
layouts = [
    layout.Max(),
    MonadTall(),
]

# Single screen
# TOP: Cpu graph, Current Layout, Systray
# BOTTOM: Group box, Window name, Clock
screens = [
    Screen(
        top = bar.Bar([widget.CPUGraph(width=bar.STRETCH, 
                                       graph_color='0066FF',
                                       fill_color='001188'),
                       widget.CurrentLayout(fontsize=18, padding=6),
                       widget.Systray()],
                       26),
        bottom = bar.Bar([widget.GroupBox(fontsize=16, margin_y=0),
                          widget.Sep(height_percent=100, linewidth=3),
                          widget.WindowName(fontsize=16, padding=24),
                          widget.Sep(height_percent=100, linewidth=3),
                          widget.Clock('%H:%M %d/%m/%y',
                                       fontsize=16, padding=6)],
                          30,),
    ),

]

# float dialog windows
@hook.subscribe.client_new
def dialogs(window):
    if (window.window.get_wm_type() == 'dialog' or
        window.window.get_wm_transient_for() or
        window.window.get_wm_class()[0] in [
             'gmrun',]):
        window.floating = True
       



