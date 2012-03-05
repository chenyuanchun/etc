#!/usr/bin/tcsh

setenv HOST `hostname`
setenv UNAME `uname -ps`
setenv BUILD_AREA /mnts/buildarea13/ase/rayc
setenv SOURCE $BUILD_AREA/src
setenv TEMP $BUILD_AREA/temp
setenv CVSROOT :pserver:cvstc:/cvstc
set CDSTOOLS=/mnts/cdstools

setenv PLATFORM `/mnts/cdstools/share/bin/getplatform`
setenv PLATFORM_WIDE `( setenv WIDE_ARCH yes; /mnts/cdstools/share/bin/getplatform)`
setenv MYOPT /mnts/buildarea13/ase/rayc/app/opt

switch ("$UNAME")
case "SunOS sparc":
	alias vi vim
	setenv MYCOMPILER SunCC-12.0.4
  setenv ORACLE_HOME /mnts/dbms//Oracle-11.2.0.1/solaris-sparc-2.10
	breaksw
case "SunOS i386":
	setenv MYCOMPILER SunCC-12.0.4
  setenv ORACLE_HOME /mnts/dbms//Oracle-11.2.0.1/solaris-i386-2.10-64
	breaksw
case "Linux x86_64":
	setenv MYCOMPILER gcc-4.6.2
  setenv ORACLE_HOME /mnts/dbms/Oracle-11.2.0.1/linux-x86_64-2.6-64
  setenv LD_LIBRARY_PATH ${MYOPT}/wx/2.12/lib:${MYOPT}/codeblock/lib
	breaksw
case "AIX powerpc":
	setenv MYCOMPILER gcc-4.6.2
  setenv ORACLE_HOME /mnts/dbms//Oracle-11.2.0.1/aix-ppc-5.3
	breaksw
endsw

#  For Sybase 12
#setenv SYBASE  /mnts/dbms/Sybase-12.5.1/$PLATFORM
#setenv SYBASE_OCS OCS-12_5
setenv JDK_HOME /mnts/cdstools/jdk-1.6.0/${PLATFORM}/
setenv JAVA_HOME $JDK_HOME


set path = (. \
    /home/rayc/bin \
    /mnts/cdstools/share/bin \
    $JDK_HOME/bin \
    /mnts/cdstools/cmake-2.8.3/${PLATFORM_WIDE}/bin \
    ${CDSTOOLS}/subversion-1.6.17gr1/${PLATFORM_WIDE}/bin \
    ${CDSTOOLS}/git-1.7.1/${PLATFORM}/bin \
    /mnts/cdstools/${PLATFORM_WIDE}/bin \
    /mnts/cdstools/${PLATFORM}/bin \
    /mnts/cdstools/${MYCOMPILER}/${PLATFORM_WIDE}/bin \
    /mnts/cdstools/binutils-2.21/${PLATFORM_WIDE}/bin \
    /home/develop/bin/${PLATFORM} \
    /home/develop/bin \
    /sbin \
    /usr/atria/bin \
    /usr/dt/bin \
    /usr/openwin/bin \
    /usr/local/bin \
    /bin \
    /usr/bin \
    /usr/ucb \
    /usr/sbin \
    /usr/ccs/bin \
    /mnts/cdstools/bison-2.3/${PLATFORM}/bin \
    /usr/bin/X11 \
#    /opt/iona/bin \
#    /opt/iona/orbix_art/1.0/bin \
#    /vobs/historisk-1/obj/${PLATFORM}/bin \
#    ${ORACLE_HOME}/bin \
#    ${SYBASE}/${SYBASE_OCS}/bin \
#    /mnts/contrib/bin/solaris_sparc \
#    /mnts/contrib/bin \
#    /mnts/packages/wpublisher/quadralay/bin \
#    /home/develop/Tools/distmake/solaris_sparc/bin \
#    /mnts/solarium/develop-96q2/bin \
#${SYBASE} \
    /mnts/cdstools/PurifyPlus-7.0/${PLATFORM}/bin ) 

if ( "$PLATFORM_WIDE" == "rhel-x86_64-5.2" ) then
  set MYAPP = /mnts/buildarea13/ase/rayc/app/opt
  set path = ( ${MYAPP}/gdb/bin $path )
  set path = ( ${MYAPP}/global-6.0/bin $path )
  set path = ( ${CDSTOOLS}/Python-2.6.2/rhel-x86_64-5.2-shared/bin/ $path )
endif

if ( "$PLATFORM" == "solaris-i386-2.10" ) then
  set path = ( ${CDSTOOLS}/vim-7.3/${PLATFORM}/bin $path )
  set path = ( ${CDSTOOLS}/emacs-23.3/${PLATFORM}/bin $path )
endif

setenv MANPATH :/local/develop-96q2/man:/mnts/contrib/man:/usr/local/test/man:/usr/local/man:/usr/man

# More variables, depending on the term/tty.
tty -s
if ($status == 0) then
set rhost="`who am i | cut -d\( -f2 | cut -d. -f1`"
if( "$rhost" == "`who am i`" ) then
	setenv RHOST ""
else
	setenv RHOST "$rhost"
endif
endif

# temporarily setting
if ($HOST != "titans" && $RHOST != ca0d0346) then
  setenv DISPLAY titans:10
endif

#setenv PURIFYOPTIONS "-max_threads=300 -always-use-cache-dir -cache-dir=/home/rayc/temp/purifycache"

# rayc
setenv PRODUCT_NAME ASE
setenv ASE_VERSION 4.7.0
setenv PATH /home/rayc/ase/scripts:$PATH

# For WorkShop license
#setenv LM_LICENSE_FILE "/home/develop/Tools/SunWorkshop/SUNWspro/license_dir/sunpro.lic,node":/mnts/cdstools/SunCC-6.2.2/share/etc/licenses

setenv CVSEDITOR vim
setenv EDITOR vim

setenv BOOST_ROOT /mnts/buildarea13/ase/rayc/tools/boost_1_46_1
source ~/.alias
source ~/.tcsh_completion
