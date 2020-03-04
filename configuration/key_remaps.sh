################################################################################
# Key Remappings for Lenovo Thinkpad T440s
################################################################################

# Note: If you want to capture a key, use the program 'xev'

# Remap Caps-Lock to Esc to make vim more comfy
xmodmap -e 'remove Lock = Caps_Lock' -e 'keycode 66 = Escape' 

# Remap the super key to bottom right prtSc because it's useless.
#xmodmap -e 'keycode 107 = Super_L'

