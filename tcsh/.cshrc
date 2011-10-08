#.cshrc
#set echo
#set verbose

umask 022
setenv HOST `hostname`
setenv UNAME `uname -ps`

setenv PLATFORM `/mnts/cdstools/share/bin/getplatform`
switch ($PLATFORM)
case hpux-pa2.0-11.00:
	setenv USER `/usr/bin/whoami`
	breaksw
case:
	setenv USER `/usr/ucb/whoami`
	breaksw
endsw

setenv ORACLE_HOME /mnts/dbms/Oracle-11.2.0.1/linux-x86_64-2.6-64
switch ("$UNAME")
case "SunOS sparc":
	alias vi vim
	setenv MYCOMPILER SunCC-11.0.9
  setenv ORACLE_HOME /mnts/dbms//Oracle-11.2.0.1/solaris-sparc-2.10
	breaksw
case "SunOS i386":
	setenv MYCOMPILER SunCC-12.0.4
  setenv ORACLE_HOME /mnts/dbms//Oracle-11.2.0.1/solaris-i386-2.10-64
	breaksw
case "Linux x86_64":
	setenv MYCOMPILER gcc-4.1.2
  setenv ORACLE_HOME /mnts/dbms/Oracle-11.2.0.1/linux-x86_64-2.6-64
	breaksw
case "AIX powerpc":
	setenv MYCOMPILER gcc-4.1.2
  setenv ORACLE_HOME /mnts/dbms//Oracle-11.2.0.1/aix-ppc-5.3
	breaksw
endsw

if( $?tcsh ) then
	set prompt="-- %w %D, %d %T %m:%B%~%b --\n%"

#  For Sybase 12
setenv SYBASE  /mnts/dbms/Sybase-12.5.1/$PLATFORM
setenv SYBASE_OCS OCS-12_5

set path = (. \
    /mnts/cdstools/jdk-1.6.0_20/${PLATFORM}/bin \
    /home/liorv/scripts /mnts/cdstools/share/bin \
    /mnts/cdstools/${PLATFORM}/bin \
    /mnts/cdstools/${MYCOMPILER}/${PLATFORM}/bin \
    /mnts/cdstools/binutils-2.9.5.0.27/${PLATFORM}/bin \
    /usr/atria/bin \
    /home/develop/bin/${PLATFORM} \
    /home/develop/bin \
    /sbin /usr/atria/bin \
    /usr/dt/bin \
    /usr/openwin/bin \
    /usr/local/bin \
    /bin \
    /usr/bin \
    /usr/ucb \
    /usr/sbin \
    /usr/ccs/bin \
    /mnts/packages/frame/bin \
    /usr/bin/X11 \
    /opt/iona/bin \
    /opt/iona/orbix_art/1.0/bin \
    /vobs/historisk-1/obj/${PLATFORM}/bin \
    ${ORACLE_HOME}/bin \
    ${SYBASE}/${SYBASE_OCS}/bin \
    /mnts/contrib/bin/solaris_sparc \
    /mnts/contrib/bin \
    /mnts/packages/wpublisher/quadralay/bin \
    /home/develop/Tools/distmake/solaris_sparc/bin \
    /mnts/solarium/develop-96q2/bin \
    ${SYBASE} \
    /mnts/cdstools/PurifyPlus-7.0/${PLATFORM}/bin ) 

set cdpath=( . \
    $HOME \
    $HOME/src470/ )

if( $?tcsh ) then
	set autolist
	set autocorrect
	set autoexpand
	set matchbeep=nomatch
	set listjobs=long

	set noglob

	set hosts=(titans oceanus medusa torsolca01 torsolca02 torsolca03 \
      torlcn01 torlcn02 torlcn03 hathor)

    complete ssh	n/*/\$hosts/	# argument from list in $hosts
    complete cd  	p/1/d/		# Directories only
    complete pushd 	p/1/d/
    complete popd 	p/1/d/
    complete mkdir 	p/1/d/
    complete rmdir 	p/1/d/
    complete complete 	p/1/c/
    complete uncomplete p/1/c/
    complete exec 	p/1/c/
    complete trace 	p/1/c/
    complete strace 	p/1/c/
    complete which 	p/1/c/
    complete where 	p/1/c/
    complete adb	p/1/c/ 
    complete gdb	p/1/c/
    complete ups	p/1/c/
    complete set	'c/*=/f/' 'p/1/s/=' 'n/=/f/'
    complete unset		p/1/s/
    complete setenv 	p/1/e/		# only environment variables 
    complete unsetenv 	p/1/e/
    complete alias 		p/1/a/		# only aliases are valid
    complete a		 	p/1/a/
    complete unalias 	p/1/a/
    complete rlogin 	c/-/"(l 8 e)"/ n/-l/u/ n/*/\$hosts/ 
    complete xrsh   	c/-/"(l 8 e)"/ n/-l/u/ n/*/\$hosts/ 
    complete gcc 	c/-I/d/ c/-L/d/ \
		 	c/-f/"(caller-saves cse-follow-jumps delayed-branch \
		               elide-constructors expensive-optimizations \
			       float-store force-addr force-mem inline \
			       inline-functions keep-inline-functions \
			       memoize-lookups no-default-inline \
			       no-defer-pop no-function-cse omit-frame-pointer \
			       rerun-cse-after-loop schedule-insns \
			       schedule-insns2 strength-reduce \
			       thread-jumps unroll-all-loops \
			       unroll-loops syntax-only all-virtual \
			       cond-mismatch dollars-in-identifiers \
			       enum-int-equiv no-asm no-builtin \
			       no-strict-prototype signed-bitfields \
			       signed-char this-is-variable unsigned-bitfields \
			       unsigned-char writable-strings call-saved-reg \
			       call-used-reg fixed-reg no-common \
			       no-gnu-binutils nonnull-objects \
			       pcc-struct-return pic PIC shared-data \
			       short-enums short-double volatile)"/ \
		 	c/-W/"(all aggregate-return cast-align cast-qual \
		      	       comment conversion enum-clash error format \
		      	       id-clash-len implicit missing-prototypes \
		      	       no-parentheses pointer-arith return-type shadow \
		      	       strict-prototypes switch uninitialized unused \
		      	       write-strings)"/ \
		 	c/-m/"(68000 68020 68881 bitfield fpa nobitfield rtd \
			       short c68000 c68020 soft-float g gnu unix fpu \
			       no-epilogue)"/ \
		 	c/-d/"(D M N)"/ \
		 	c/-/"(f W vspec v vpath ansi traditional \
			      traditional-cpp trigraphs pedantic x o l c g L \
			      I D U O O2 C E H B b V M MD MM i dynamic \
			      nodtdlib static nostdinc undef)"/ \
		 	c/-l/f:*.a/ \
		 	n/*/f:*.{c,C,cc,o,a}/
    complete g++ c/-I/d/ c/-L/d/ n/*/f:*.{C,cc,o}/ \
		 	c/-W/"(all aggregate-return cast-align cast-qual \
		      	       comment conversion enum-clash error format \
		      	       id-clash-len implicit missing-prototypes \
		      	       no-parentheses pointer-arith return-type shadow \
		      	       strict-prototypes switch uninitialized unused \
		      	       write-strings)"/
    complete CC 	n/*/f:*.{C,cc,o}/

    complete find 	n/-fstype/"(nfs 4.2)"/ n/-name/f/ \
		  	n/-type/"(c b d f p l s)"/ n/-user/u/ n/-exec/c/ \
		  	n/-ok/c/ n/-cpio/f/ n/-ncpio/f/ n/-newer/f/ \
		  	c/-/"(fstype name perm prune type user nouser \
		  	     group nogroup size inum atime mtime ctime exec \
			     ok print ls cpio ncpio newer xdev depth)"/ \
			n/*/d/

    complete kill	c/-/S/ c/%/j/
    complete %*		c/%/j/			# fill in the jobs builtin
    complete fg		c/%/j/
    complete bg		c/%/j/
    complete stop	c/%/j/

    complete limit	c/-/"(h)"/ n/*/l/
    complete unlimit	c/-/"(h)"/ n/*/l/

    complete zcat	n/*/f:*.Z/
    complete finger c/*@/\$hosts/ p/1/u/@ 

    complete talk p/1/'`users | tr " " "\012" | uniq`'/ \
		  n/*/\`who\ \|\ grep\ \$:1\ \|\ awk\ \'\{\ print\ \$2\ \}\'\`/

    if ( -f $HOME/.netrc ) then
	complete ftp    p@1@\`cat\ $HOME/.netrc\ \|\ \ awk\ \'\{\ print\ \$2\ \}\'\`@
    endif

    complete rcp c/*:/f/ C@[./]*@f@ n/*/\$hosts/:

    complete nm		n/*/f:^*.{h,C,c,cc}/
    complete ar c/[dmpqrtx]/"(c l o u v a b i)"/ p/1/"(d m p q r t x)"// \
		p/2/f:*.a/ p/*/f:*.o/

    complete dd c/if=/f/ c/of=/f/ \
		c/conv=*,/"(ascii ebcdic ibm block unblock \
			    lcase ucase swap noerror sync)"/,\
		c/conv=/"(ascii ebcdic ibm block unblock \
			  lcase ucase swap noerror sync)"/,\
	        c/*=/x:'<number>'/ \
		n/*/"(if of conv ibs obs bs cbs files skip file seek count)"/=

    complete mail	c/-/"(e i f n s u v)"/ c/*@/\$hosts/ \
			n/-s/x:'<subject>'/ n/-u/u/ \
			c@+@\`/bin/ls\ -1\ ~/Mail\`@ n/-f/f/ n/*/u/
	unset noglob
endif

# history auto-complete
bindkey -b ^p "history-search-backward"
bindkey -b ^n "history-search-forward"

setenv MANPATH :/local/develop-96q2/man:/mnts/contrib/man:/usr/local/test/man:/usr/local/man:/usr/man

setenv HR_SEED 123456

# More variables, depending on the term/tty.
tty -s
if ($status == 0) then
set rhost="`who am i | cut -d\( -f2 | cut -d: -f1`"
if( "$rhost" == "`who am i`" ) then
	setenv RHOST ""
else
	setenv RHOST "$rhost"
endif
endif

# Other shell variables.
set notify set history=1000 savehist=1000
set mail=/usr/spool/mail/$USER
setenv USE97R2 1


setenv PURIFYOPTIONS "-max_threads=300 -always-use-cache-dir -cache-dir=/home/rayc/temp/purifycache"

# rayc
setenv PRODUCT_NAME ASE
setenv ASE_VERSION 4.7.0
setenv SOURCE /mnts/buildarea13/ase/rayc/src
setenv MNTSASE /mnts/buildarea13/ase
setenv PATH /home/rayc/ase/scripts:$PATH

setenv MYPLATFORM solaris-sparc64-2.10
switch ($PLATFORM)
case rhel-i686-5.2:
  setenv MYPLATFORM rhel-x86_64-5.2
  setenv RUN_PLATFORM rhel-x86_64-5.2-gcc-4.3.3
  setenv DEBUG_PLATFORM $RUN_PLATFORM-noopt-debug
  breaksw
case solaris-i386-2.10:
  setenv MYPLATFORM solaris-x86_64-2.10
  setenv RUN_PLATFORM $MYPLATFORM-SunCC-12.0.4
  breaksw
case solaris-sparc-2.10:
  setenv MYPLATFORM solaris-sparc64-2.10
  setenv RUN_PLATFORM $MYPLATFORM-SunCC-12.0.4
  breaksw
endsw

setenv PATH /mnts/cdstools/bison-2.3/${PLATFORM}/bin/:${PATH}:/mnts/cdstools/solaris-i386-2.10/bin/

# For WorkShop license
setenv LM_LICENSE_FILE "/home/develop/Tools/SunWorkshop/SUNWspro/license_dir/sunpro.lic,node":/mnts/cdstools/SunCC-6.2.2/share/etc/licenses

setenv JDK_HOME /mnts/cdstools/jdk-1.6.0_20/${PLATFORM}/
setenv JAVA_HOME $JDK_HOME

setenv CVSROOT :pserver:algocvs:/cvs
setenv CVSEDITOR vim
setenv EDITOR vim

setenv BOOST_ROOT /mnts/buildarea13/ase/rayc/tools/boost_1_46_1

source ~/.alias
unsetenv LANG
