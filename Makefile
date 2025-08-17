CONFIGS = i3 polybar nvim alacritty picom rofi
FILES = 

smv:
	@for name in $(CONFIGS); do \
		if [ -d $$HOME/.config/$$name ]; then \
			mv $$HOME/.config/$$name $$HOME/.config/$$name.bak; \
		fi; \
		ln -sfn $(PWD)/$$name $$HOME/.config/$$name; \
	done

	@for file in $(FILES); do \
		if [ -e $$HOME/.config/$$file ]; then \
			mv $$HOME/.config/$$file $$HOME/.config/$$file.bak; \
		fi; \
		ln -sfn $(PWD)/$$file $$HOME/.config/$$file; \
	done

nobak:
	@read -p "This will delete all ~/.config/*.bak files and dirs. Proceed? [y/N] " ans; \
	if [ "$$ans" = "Y" ] || [ "$$ans" = "y" ]; then \
		echo "Removing backups..."; \
		rm -rf $$HOME/.config/*.bak; \
	else \
		echo "Aborted."; \
	fi

