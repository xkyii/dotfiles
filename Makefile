
DIR=$(shell pwd)
Sublime3DIR=~/Library/Application\ Support/Sublime\ Text\ 3


all: symlinks
	@echo "Initialize slinks DONE!"

su:
	@sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

symlinks:
	@ln -sf $(DIR)/osx/bashrc ~/.bashrc
	@ln -sf $(DIR)/zsh/zshrc ~/.zshrc
	@ln -sf $(DIR)/zsh/zlogin ~/.zlogin
	@ln -sf $(DIR)/zsh/vk_custom ~/.oh-my-zsh
	#@ln -sf $(DIR)/nvim ~/.config/
	@ln -sf $(DIR)/tmux/tmux.conf ~/.tmux.conf
	@echo "Check Package Control.sublime-settings -> installed_packages for missing Packages"
	@ln -sf $(DIR)/SublimeText3/Packages/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
	@ln -sf $(DIR)/SublimeText3/Packages/Rust ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
	@ln -sf $(DIR)/VSCode/User ~/Library/Application\ Support/Code
	@ln -sf $(DIR)/alfred/Alfred.alfredpreferences  ~/Library/Application\ Support/Alfred\ 3
	@echo "make symlinks DONE!"

diff:
	@diff $(Sublime3DIR)/Packages/OmniMarkupPreviewer $(DIR)/SublimeText3/OmniMarkupPreviewer  > $(DIR)/SublimeText3/Patch/OmniMarkupPreviewer.patch -rupN

patch:
	@patch -d $(Sublime3DIR)/Packages/OmniMarkupPreviewer -p0 < $(DIR)/SublimeText3/Patch/OmniMarkupPreviewer.patch

unpatch:
	@patch -d $(Sublime3DIR)/Packages/OmniMarkupPreviewer -p0 < $(DIR)/SublimeText3/Patch/OmniMarkupPreviewer.patch -R

install-homebrew:
	ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install caskroom/cask/brew-cask
	brew tap caskroom/cask
	brew tap caskroom/versions
	brew tap vkyii/tap

install-soft: su
	brew install git
	brew install proxychains-ng
	brew cask install sublime-text
	brew cask install sourcetree
	brew cask install shadowsocksx
	brew cask install qq
	brew cask install neteasemusic
	brew cask install alfred

install-sh:
	brew install z
	brew install zsh
	brew install tmux
	brew cask install iterm2
	@/usr/libexec/PlistBuddy -c 'Add :LSUIElement bool true' /Applications/iTerm.app/Contents/Info.plist # remove from Dock
	# @/usr/libexec/PlistBuddy -c 'Delete :LSUIElement' /Applications/iTerm.app/Contents/Info.plist # restore
	@echo "change default zsh"
	sudo dscl . -delete /Users/${USER} UserShell
	sudo dscl . -append /Users/${USER} UserShell $(shell which zsh)
	@echo "install oh-my-zsh"
	sh -c "$$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	@echo "install iterm2-Solarized themes"
	@echo "See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes"
	curl -L https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors > ~/Downloads/Solarized\ Dark.itermcolors
	open ~/Downloads/Solarized\ Dark.itermcolors
	@echo "set: iTerm -> preferences -> profiles -> colors -> load presets"

	@echo "install menlo for powerline Font"
	curl -L https://github.com/abertsch/Menlo-for-Powerline/raw/master/Menlo%20for%20Powerline.ttf > ~/Downloads/Menlo%20for%20Powerline.ttf
	open ~/Downloads/Menlo%20for%20Powerline.ttf
	@echo "oh-my-zsh + iterm2 done"

anyenv:
	git clone https://github.com/riywo/anyenv ~/.anyenv

env-java:
	anyenv install jenv
	@exec $SHELL -l
	brew cask install java

env-react-native:
	brew install node
	brew install watchman
	brew install flow
	npm install -g react-native-cli

env-android: su
	brew cask install virtualbox
	brew cask install https://raw.githubusercontent.com/vkyii/homebrew-tap/master/Casks/genymotion.rb
	brew install android-sdk

env-react-native-android : env-android env-react-native
	echo "See https://facebook.github.io/react-native/docs/getting-started.html#content"

