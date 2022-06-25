all: install

install:
	cp -i  .bash_profile ${HOME}/
	cp -i  .bashrc       ${HOME}/
	cp -ir .config/      ${HOME}/
	cp -ir .local/       ${HOME}/
	cp -i  .xinitrc      ${HOME}/
	cp -i  .Xresources   ${HOME}/

update:
	cp -i  ${HOME}/.bash_profile .
	cp -i  ${HOME}/.bashrc       .
	cp -ir ${HOME}/.config       .
	cp -ir ${HOME}/.local        .
	cp -i  ${HOME}/.xinitrc      .
	cp -i  ${HOME}/.Xresources   .
