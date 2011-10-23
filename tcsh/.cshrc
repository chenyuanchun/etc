#.cshrc
#set echo
#set verbose

umask 022
unsetenv LANG

if( $?tcsh ) then
	set prompt="-- %w %D, %d %T %m:%B%~%b --\n% "

alias asemake  "algomake CCACHE=no OPT=no DEBUG=yes NO_SHARED_OBJECTS=no MULTITHREAD=yes NO_HARD_LINKS=yes PARALLEL=4 SOURCEPRO=yes"
alias 470make asemake GENLIB_DEBUG=yes 
