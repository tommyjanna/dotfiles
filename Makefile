all: install

install:
	cp .vimrc ~/
	cp .bashrc ~/
	cp .tmux.conf ~/
	cp stats.json ~/.config/transmission/

update:
	cp ~/.vimrc .
	cp ~/.bashrc .
	cp ~/.tmux.conf .
	cp ~/.config/transmission/stats.json .
