# history management
shopt -s histappend
#export PROMPT_COMMAND="history -n; history -a"
# Default grep options
export GREP_OPTIONS='--exclude *~'
# MacPorts Installer addition on 2010-10-14_at_16:42:56: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/CrossPack-AVR/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
export PATH=$HOME/bin:/usr/local/bin:$PATH
# Use system-installed Qt4 instead of MacPorts Qt4
# FIXME: This interferes with e.g. maven from ports which should be preferred over system maven
#export PATH=/usr/bin:$PATH
#export QMAKESPEC=macx-g++
# Qt3
#export QTDIR=/usr/local/qt
#export DYLD_LIBRARY_PATH=$QTDIR/lib
#export PATH=$QTDIR/bin:$PATH
#export PATH=$HOME/install/SoQt3-hacking/bin:$PATH
# Coin-dev && SoQt4
#export PATH=$HOME/install/Coin/bin:$PATH
#export DYLD_LIBRARY_PATH=$HOME/install/simage/lib
# Misc Leopard testing
alias locate=mdlocate
alias less='less -r'
alias md5sum='md5 -r'
# git
#PS1='\h:\W$(__git_ps1 "(%s)") \u\$ '
# ..use vcprompt instead
PS1='\h:\w $(vcprompt)\u\$ '
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi
. ~/.nvm/nvm.sh
##
# Your previous /Users/kintel/.profile file was backed up as /Users/kintel/.profile.macports-saved_2013-12-03_at_00:16:52
##
# MacPorts Installer addition on 2013-12-03_at_00:16:52: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
##
# Your previous /Users/kintel/.profile file was backed up as /Users/kintel/.profile.macports-saved_2015-12-25_at_14:55:41
##
# MacPorts Installer addition on 2015-12-25_at_14:55:41: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
