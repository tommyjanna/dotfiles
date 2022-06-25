all: install

install:
	cp    .bash_profile ${HOME}/
	cp    .bashrc       ${HOME}/
	cp -r .config/      ${HOME}/
	cp -r .local/       ${HOME}/
	cp    .xinitrc      ${HOME}/
	cp    .Xresources   ${HOME}/

update:
	cp    ${HOME}/.bash_profile .
	cp    ${HOME}/.bashrc       .
	cp -r ${HOME}/.config       .
	cp -r ${HOME}/.local        .
	cp    ${HOME}/.xinitrc      .
	cp    ${HOME}/.Xresources   .
