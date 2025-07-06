smv:
	@if [ -d ~/.config/i3 ]; then \
		mv ~/.config/i3 ~/.config/i3.bak; \
	fi
	@ln -sfn $(PWD)/i3 ~/.config/i3

	@if [ -d ~/.config/nvim ]; then \
		mv ~/.config/nvim ~/.config/nvim.bak; \
	fi
	@ln -sfn $(PWD)/nvim ~/.config/nvim

	@if [ -d ~/.config/alacritty ]; then \
		mv ~/.config/alacritty ~/.config/alacritty.bak; \
	fi
	@ln -sfn $(PWD)/alacritty ~/.config/alacritty

