all: install

install:
	cp .vimrc ~/
	cp .bashrc ~/
	cp .tmux.conf ~/

update:
	cp ~/.vimrc .
	cp ~/.bashrc .
	cp ~/.tmux.conf .
