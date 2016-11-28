# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
MY_BASHRC=$HOME/mydata/settings/etc/bash/rayrc
[ -f $MY_BASHRC -a -n "$PS1" ] && . $MY_BASHRC

# Java
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# hadoop alias
HDP_ALIAS=$HOME/alias.hdp
[ -f $HDP_ALIAS ] && . $HDP_ALIAS

alias clipboard='xclip -selection clipboard'

# added by Miniconda2 4.0.5 installer
export PATH=$HOME/miniconda2/bin:$PATH

#spring cli
PATH=/usr/spring-boot/bin:$PATH
SPRING_BASH=/usr/spring-boot/shell-completion/bash/spring.bash
[ -f $SPRING_BASH ] && . $SPRING_BASH

#hbase client
export HBASE_CONF_DIR=${HOME}/config
