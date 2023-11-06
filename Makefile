update:
	cp -R ~/.config/nvim/lua/custom .
	git add custom
	git ci -m 'Update dotfiles'
	git push
