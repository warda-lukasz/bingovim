deps-install:
	@echo "Installing dependencies..."
	curl -Lo phpactor.phar https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar	
	chmod a+x phpactor.phar
	mkdir -p ~/.local/bin
	mv phpactor.phar ~/.local/bin/phpactor
	npm install -g neovim
	npm install -g intelephense
	@echo "Done! All good!"
