update:
	cp -R ~/.config/nvim/lua/custom .
	git ci -m 'Update dotfiles' custom
	git push
