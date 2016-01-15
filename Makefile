
DIR=/Users/vkyii/Documents/Code/dotfiles


all: symlinks
	@echo "Initialize"

symlinks:
	@ln -sf $(DIR)/osx/bashrc ~/.bashrc
	@ln -sf $(DIR)/zsh/zshrc ~/.zshrc
	@ln -s  $(DIR)/nvim ~/.config/nvim
