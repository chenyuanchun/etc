#.cshrc
umask 022
unsetenv LANG

if( $?tcsh ) then
	set prompt="\n=== [%w %D, %d %T] %S%m%s%B%~%b ===\n% "

alias asemake  "algomake CCACHE=no OPT=no DEBUG=yes NO_SHARED_OBJECTS=no MULTITHREAD=yes NO_HARD_LINKS=yes PARALLEL=4 NO_DOXYGEN_DOC=yes"
alias 470make asemake GENLIB_DEBUG=yes
alias linuxmake asemake COMPILER=gcc tool_binutils_version=2.21
alias 460make linuxmake tool_gcc_version=4.1.2
alias 450make linuxmake tool_gcc_version=3.3.3
alias genlibmake "asemake GL_MT=yes"
