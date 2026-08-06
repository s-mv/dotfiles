CONFIGS = fusuma fuzzel hypr waybar i3 polybar nvim alacritty picom rofi touchegg sway sioyek wallpapers zathura gdb
FILES   = starship.toml libinput-gestures.conf

smv:
	@for name in $(CONFIGS); do \
		if [ -L $$HOME/.config/$$name ]; then \
			rm $$HOME/.config/$$name; \
		elif [ -d $$HOME/.config/$$name ]; then \
			mv $$HOME/.config/$$name $$HOME/.config/$$name.bak; \
		fi; \
		ln -sfn $(PWD)/$$name $$HOME/.config/$$name; \
	done

	@for file in $(FILES); do \
		if [ -L $$HOME/.config/$$file ]; then \
			rm $$HOME/.config/$$file; \
		elif [ -e $$HOME/.config/$$file ]; then \
			mv $$HOME/.config/$$file $$HOME/.config/$$file.bak; \
		fi; \
		ln -sfn $(PWD)/$$file $$HOME/.config/$$file; \
	done

nobak:
	@read -p "This will delete all ~/.config/*.bak files and dirs. Proceed? [y/N] " ans; \
	if [ "$$ans" = "Y" ] || [ "$$ans" = "y" ]; then \
		rm -rf $$HOME/.config/*.bak; \
	else \
		echo "Aborted."; \
	fi

