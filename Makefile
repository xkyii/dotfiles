
DIR=$(shell pwd)
Sublime3DIR=~/Library/Application\ Support/Sublime\ Text\ 3


all: symlinks
	@echo "Initialize DONE!"

symlinks:
	@ln -sf $(DIR)/osx/bashrc ~/.bashrc
	@ln -sf $(DIR)/zsh/zshrc ~/.zshrc
	@ln -sf $(DIR)/zsh/vk_custom ~/.oh-my-zsh
	@ln -sf $(DIR)/nvim ~/.config/
	@ln -sf $(DIR)/tmux/tmux.conf ~/.tmux.conf
	@ln -sf $(DIR)/SublimeText3/Packages/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
	@ln -sf $(DIR)/SublimeText3/Packages/Rust ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
	@echo "make symlinks DONE!"

diff:
	@diff $(Sublime3DIR)/Packages/OmniMarkupPreviewer $(DIR)/SublimeText3/OmniMarkupPreviewer  > $(DIR)/SublimeText3/Patch/OmniMarkupPreviewer.patch -rupN

patch:
	@patch -d $(Sublime3DIR)/Packages/OmniMarkupPreviewer -p0 < $(DIR)/SublimeText3/Patch/OmniMarkupPreviewer.patch

unpatch:
	@patch -d $(Sublime3DIR)/Packages/OmniMarkupPreviewer -p0 < $(DIR)/SublimeText3/Patch/OmniMarkupPreviewer.patch -R
