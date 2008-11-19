tar: dotvim.tar.gz

dotvim.tar.gz:
	tar cvzf dotvim.tar.gz `cat MANIFEST`

.PHONY: syntax clean diff 
clean:
	rm -f dotvim.tar.gz

syntax: 
	cp syntax/eyapp.vim ${HOME}/.vim/syntax/
	cp filetype.vim  ${HOME}/.vim/

diff:
	diff .vimrc ${HOME}/.vimrc
	diff .ctags ${HOME}/.ctags

install: syntax diff
	# copy files .vimrc and .ctags to  ${HOME}. Be sure what you are doing!
