
DIR=$(shell pwd)
SublimeDIR=~/Library/Application\ Support/Sublime\ Text\ 3


all: symlinks
	@echo "Initialize DONE!"

symlinks:
	@ln -sf $(DIR)/osx/bashrc ~/.bashrc
	@ln -sf $(DIR)/zsh/zshrc ~/.zshrc
	@ln -sf $(DIR)/zsh/vk_custom ~/.oh-my-zsh
	@ln -sf $(DIR)/nvim ~/.config/
	@ln -sf $(DIR)/tmux/tmux.conf ~/.tmux.conf
	@ln -sf $(DIR)/SublimeText3/Packages/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
	@echo "make symlinks DONE!"

patch:
	@patch  $(SublimeDIR)/Packages/OmniMarkupPreviewer/OmniMarkupLib/RendererManager.py < $(DIR)/SublimeText3/Patch/OmniMarkupPreviewer/OmniMarkupLib/RendererManager.py.patch

unpatch:
	@patch  $(SublimeDIR)/Packages/OmniMarkupPreviewer/OmniMarkupLib/RendererManager.py < $(DIR)/SublimeText3/Patch/OmniMarkupPreviewer/OmniMarkupLib/RendererManager.py.patch -R