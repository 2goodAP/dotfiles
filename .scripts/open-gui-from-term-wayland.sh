# E:
# No protocol specified
# Unable to init server: Could not connect: Connection refused
# (gedit:2284): Gtk-WARNING **: cannot open display: :0

# Fix??
xhost +si:localuser:root
# [see] localuser:root being added to access control list
# Mean: add user to root(sudo GUI + terminal)

# xhost -si:localuser:root
# Mean: Reset to default, user cannot run root(GUI) in terminal.
