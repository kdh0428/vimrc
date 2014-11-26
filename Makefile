OS = $(shell uname)

<<<<<<< HEAD
FONT_PATH = unknown
ifeq ($(OS),Darwin)
	FONT_PATH = ~/Library/Fonts/
else
	FONT_PATH = ~/.fonts/
endif

=======
>>>>>>> 3da67d68a73d7525a47ae01cf9da177680018a88
link:
	ln -sf `pwd`/vimrc $$HOME/.vimrc
	ln -sf `pwd`/vim $$HOME/.vim

unlink:
<<<<<<< HEAD
	rm -rf $$HOME/.vim 
	rm -rf $$HOME/.vimrc

install: link download_fonts install_vundle install_ycm etc

uninstall: unlink
	rm -rf ./vim/bundle/Vundle.vim

clean: uninstall

download_fonts:
ifneq ($(FONT_PATH), unknown)
	mkdir -p $(FONT_PATH)
	wget "http://downloads.sourceforge.net/project/dejavu/dejavu/2.34/dejavu-fonts-ttf-2.34.zip?r=http%3A%2F%2Fdejavu-fonts.org%2Fwiki%2FDownload&ts=1380695998&use_mirror=jaist" -O font.zip
	mkdir -p ./fonts
	unzip font.zip -d ./fonts
	mv ./fonts/*/* ./fonts
	cp -R ./fonts/ttf/*.ttf $(FONT_PATH)
	rm -rf ./fonts
	rm -rf ./font.zip

	wget "http://levien.com/type/myfonts/Inconsolata.otf"
	mv ./Inconsolata.otf $(FONT_PATH)
else
	echo "Unknown font path, uname is $(OS), path is $(FONT_PATH)"
endif

install_vundle:
	git clone https://github.com/gmarik/Vundle.vim.git ./vim/bundle/Vundle.vim
	vim +PluginInstall +qall

install_ycm:
	cd ./vim/bundle/YouCompleteMe && ./install.sh --clang-completer --system-libclang
=======
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
	git submodule init
	git submodule update
	vim +BundleInstall +qall
>>>>>>> 3da67d68a73d7525a47ae01cf9da177680018a88

etc:
	git config --global core.editor "vim"
