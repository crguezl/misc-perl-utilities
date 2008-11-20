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
	#

public: 
	rsync -aue ssh . vim:public_html/vim

google:
	svn commit 
	rm -fR /tmp/google-vimutilities
	svn checkout https://misc-perl-utilities.googlecode.com/svn/trunk/vimutilities /tmp/google-vimutilities --username casiano.rodriguez.leon
	cd /tmp/google-vimutilities
	svn export --force svn+ssh://orion/var/svn/casiano/VIM/trunk .
	#Issue a commit in /tmp/google-vimutilities
	#svn commit /tmp/google-vimutilities
