OS = $(shell uname)

link:
	ln -sf `pwd`/vimrc $$HOME/.vimrc
	ln -sf `pwd`/vim $$HOME/.vim

unlink:
	rm -f $$HOME/.vim 
	rm -f $$HOME/.vimrc

install: link download_fonts install_vundle etc

uninstall: unlink 

download_fonts:
	if [ X"$(OS)" = X"Darwin" ]; then \
	cd ~/Library/Fonts/; \
	elif [ X"$(OS)" = X"Linux" ]; then \
	mkdir -p ~/.fonts; cd ~/.fonts; \
	else \
	echo "Specify your font install directory:"; read FONT_PATH; echo $$FONT_PATH;cd $$FONT_PATH; \
	fi;  \
	curl -O http://dev.naver.com/frs/download.php/441/NanumGothicCoding-2.0.zip; \
	unzip NanumGothicCoding-2.0.zip;  \
	rm -f NanumGothicCoding-2.0.zip;

install_vundle:
	vim +PluginInstall +qall

etc:
	git config --global core.editor "vim"
