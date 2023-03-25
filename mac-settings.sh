# these two lines allow apps to remove itself from dock bar after quitting
defaults write com.apple.dock show-recents -bool no
defaults write com.apple.dock recent-apps -array # intentionally empty
