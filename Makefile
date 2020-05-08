all: install

install:
	cp .vimrc ~/
	cp .bashrc ~/

update:
	cp ~/.vimrc .
	cp ~/.bashrc .
