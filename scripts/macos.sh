#!/bin/zsh
#                        ___  ____
#  _ __ ___   __ _  ___ / _ \/ ___|
# | '_ ` _ \ / _` |/ __| | | \___ \
# | | | | | | (_| | (__| |_| |___) |
# |_| |_| |_|\__,_|\___|\___/|____/


# ==============================================================================
# General UI/UX
# ==============================================================================

# Turn off the “Application Downloaded from Internet” quarantine warning.
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Don’t create .DS_Store files on USB and network volumes.
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Expand save panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Always show scrollbars.
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Hide Spotlight icon from the menubar.
defaults -currentHost write com.apple.Spotlight MenuItemHidden -bool true

# Disable screensaver.
defaults -currentHost write com.apple.screensaver idleTime -int 0

# Set screenshots format and location.
defaults write com.apple.screencapture type -string "jpg"
defaults write com.apple.screencapture location -string "$HOME/Downloads"

# Hot Corners
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-br-corner -int 0

# ==============================================================================
# Keyboard / Trackpad / Mouse
# ==============================================================================

# Set the key repeat rate and make it happen more quickly.
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# Disable all automatic correction and substitution features.
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Set trackpad and mouse speed.
defaults write -g com.apple.trackpad.scaling -float 1
defaults write -g com.apple.mouse.scaling -float -1

# ==============================================================================
# Dock
# ==============================================================================

# Set the icon size of Dock items.
defaults write com.apple.dock tilesize -int 48

# Change the minimize/maximize window effect.
defaults write com.apple.dock mineffect -string "scale"

# Make Dock icons of hidden applications translucent.
defaults write com.apple.dock showhidden -bool true

# Don’t show recent applications in Dock.
defaults write com.apple.dock recent-apps -array
defaults write com.apple.dock show-recents -bool false

# ==============================================================================
# Finder
# ==============================================================================

# Hide icons for hard drives, removable media and servers on the Desktop.
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# Set the $HOME folder as the default location for new Finder windows.
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show all file extensions.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension.
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Empty bin items after 30 days.
defaults write com.apple.finder FXRemoveOldTrashItems -bool true

# Sort folders first.
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default.
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Use list view in all Finder windows by default.
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show pathbar in Finder.
defaults write com.apple.finder ShowPathbar -bool true

# No hover delay for the hidden icon in the toolbar.
defaults write NSGlobalDomain NSToolbarTitleViewRolloverDelay -float 0

# Set the spring loading delay for folders.
defaults write NSGlobalDomain com.apple.springing.delay -float 0.1

# Enable snap-to-grid for icons on the Desktop and in Finder.
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Show the ~/Library folder.
chflags nohidden ~/Library

# ==============================================================================
# Apps
# ==============================================================================

# Terminal: Don’t mark lines.
defaults write com.apple.Terminal AutoMarkPromptLines -bool false

# ==============================================================================
# Restart
# ==============================================================================

for app in "SystemUIServer" "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done
