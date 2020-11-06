all: install

install:
	cp .bashrc ~/
	cp -r bin/ ~/
	cp -r .config/ ~/
	cp .tmux.conf ~/

update:
	cp ~/.bashrc .
	cp ~/bin/compile .
	cp ~/bin/run . 
	cp ~/.config/compton.conf .
	cp ~/.config/transmission/stats.json .
	cp ~/.config/nvim/init.vim .
	cp ~/.tmux.conf .
