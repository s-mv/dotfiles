smv:
	@if [ -d ~/.config/i3 ]; then \
		mv ~/.config/i3 ~/.config/i3.bak; \
	fi
	@ln -sfn $(PWD)/i3 ~/.config/i3

	@if [ -d ~/.config/nvim ]; then \
		mv ~/.config/nvim ~/.config/nvim.bak; \
	fi
	@ln -sfn $(PWD)/nvim ~/.config/nvim

	@if [ -d ~/.config/starship.toml ]; then \
		mv ~/.config/starship.toml ~/.config/starship.toml.bak; \
	fi
	@ln -sfn $(PWD)/starship.toml ~/.config/starship.toml

	@if [ -d ~/.config/alacritty ]; then \
		mv ~/.config/alacritty ~/.config/alacritty.bak; \
	fi
	@ln -sfn $(PWD)/alacritty ~/.config/alacritty

nobak:
	@read -p "This will delete all ~/.config/*.bak directories. Proceed? [y/N] " ans; \
	if [ "$$ans" = "Y" ] || [ "$$ans" = "y" ]; then \
		echo "Removing backups..."; \
		rm -rf ~/.config/*.bak; \
	else \
		echo "Aborted."; \
	fi

