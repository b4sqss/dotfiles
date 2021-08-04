config.set('content.cookies.accept', 'no-3rdparty')
config.set("colors.webpage.darkmode.enabled", False)
config.set('content.headers.do_not_track', True)
config.set('content.webgl', False)
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info})')
config.set('content.images', True)
config.set('content.javascript.enabled', False)
config.set('content.geolocation', False)
config.set('content.private_browsing', True)
config.set('content.canvas_reading', False)

config.load_autoconfig(True)

config.bind('M', 'hint links spawn mpd {hint-url}')

bg0 = "#2e3440"
bg1 = "#2e3440"
bg2 = "#3b4252"
bg3 = "#434c5e"
bg4 = "#4c566a"

fg0 = "#d8dee9"
fg1 = "#e5e9f0"
fg2 = "#eceff4"
fg3 = "#eceff4"
fg4 = "#eceff4"

bright_red = "#bf616a"
bright_green = "#a3be8c"
bright_yellow = "#ebcb8b"
bright_blue = "#5e81ac"
bright_purple = "#b48ead"
bright_aqua = "#88c0d0"
bright_gray = "#434c5e"
bright_orange = "#d08770"

dark_red = "#bf616a"
dark_green = "##a3be8c"
dark_yellow = "##ebcb8b"
dark_blue = "#5e81ac"
dark_purple = "#b48ead"
dark_aqua = "#88c0d0"
dark_gray = "#434c5e"
dark_orange = "#d08770"

### Completion

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = [fg1, bright_aqua, bright_yellow]

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = bg0

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = c.colors.completion.odd.bg

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = bright_blue

# Background color of the completion widget category headers.
c.colors.completion.category.bg = bg1

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = c.colors.completion.category.bg

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = c.colors.completion.category.bg

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = fg0

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = bg4

# Top border color of the selected completion item.
c.colors.completion.item.selected.border.top = bg2

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = c.colors.completion.item.selected.border.top

# Foreground color of the matched text in the selected completion item.
c.colors.completion.item.selected.match.fg = bright_orange

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = c.colors.completion.item.selected.match.fg

# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = c.colors.completion.item.selected.fg

# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = c.colors.completion.category.bg

### Context menu

# Background color of disabled items in the context menu.
c.colors.contextmenu.disabled.bg = bg3

# Foreground color of disabled items in the context menu.
c.colors.contextmenu.disabled.fg = fg3

# Background color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.bg = bg0

# Foreground color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.fg =  fg2

# Background color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.bg = bg2

#Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.fg = c.colors.contextmenu.menu.fg

### Downloads

# Background color for the download bar.
c.colors.downloads.bar.bg = bg0

# Color gradient start for download text.
c.colors.downloads.start.fg = bg0

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = bright_blue

# Color gradient end for download text.
c.colors.downloads.stop.fg = c.colors.downloads.start.fg

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = bright_aqua

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = bright_red

### Hints

# Font color for hints.
c.colors.hints.fg = bg0

# Background color for hints.
c.colors.hints.bg = 'rgba(250, 191, 47, 200)'  # bright_yellow

# Font color for the matched part of hints.
c.colors.hints.match.fg = bg4

### Keyhint widget

# Text color for the keyhint widget.
c.colors.keyhint.fg = fg4

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = fg0

# Background color of the keyhint widget.
c.colors.keyhint.bg = bg0

### Messages

# Foreground color of an error message.
c.colors.messages.error.fg = bg0

# Background color of an error message.
c.colors.messages.error.bg = bright_red

# Border color of an error message.
c.colors.messages.error.border = c.colors.messages.error.bg

# Foreground color of a warning message.
c.colors.messages.warning.fg = bg0

# Background color of a warning message.
c.colors.messages.warning.bg = bright_purple

# Border color of a warning message.
c.colors.messages.warning.border = c.colors.messages.warning.bg

# Foreground color of an info message.
c.colors.messages.info.fg = fg2

# Background color of an info message.
c.colors.messages.info.bg = bg0

# Border color of an info message.
c.colors.messages.info.border = c.colors.messages.info.bg

### Prompts

# Foreground color for prompts.
c.colors.prompts.fg = fg2

# Border used around UI elements in prompts.
c.colors.prompts.border = f'1px solid {bg1}'

# Background color for prompts.
c.colors.prompts.bg = bg3

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = bg2

### Statusbar

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = fg2

# Background color of the statusbar.
c.colors.statusbar.normal.bg = bg0

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = bg0

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = dark_aqua

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = bg0

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = dark_blue

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = bright_purple

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = bg0

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = fg3

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = bg1

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = c.colors.statusbar.private.fg

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = c.colors.statusbar.command.bg

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = bg0

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = dark_purple

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = c.colors.statusbar.caret.fg

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = bright_purple

# Background color of the progress bar.
c.colors.statusbar.progress.bg = bright_blue

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = fg4

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = dark_red

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = bright_orange

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = bright_red

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = fg0

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = bright_purple

### tabs

# Background color of the tab bar.
c.colors.tabs.bar.bg = bg0

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = bright_blue

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = bright_aqua

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = bright_red

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = fg1

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = bg0

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = c.colors.tabs.odd.fg

# Background color of unselected even tabs.
c.colors.tabs.even.bg = bg0

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = dark_aqua

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = bg0

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = c.colors.tabs.selected.odd.fg

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = bg0

# Background color of pinned unselected even tabs.
c.colors.tabs.pinned.even.bg = bright_green

# Foreground color of pinned unselected even tabs.
c.colors.tabs.pinned.even.fg = bg0

# Background color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.bg = bright_green

# Foreground color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.fg = c.colors.tabs.pinned.even.fg

# Background color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.bg = bg0

# Foreground color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.fg = c.colors.tabs.selected.odd.fg

# Background color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.bg = c.colors.tabs.pinned.selected.even.bg

# Foreground color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.fg = c.colors.tabs.selected.odd.fg

# Background color for webpages if unset (or empty to use the theme's
# color).
c.colors.webpage.bg = bg4


c.url.start_pages = "/home/basqs/Documents/Projects/startpage/index.html"
c.url.default_page = "/home/basqs/Documents/Project/startpage/index.html"
