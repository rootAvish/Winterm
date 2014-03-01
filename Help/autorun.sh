#!/bin/bash

CURRENT_PATH=`echo $0 | sed 's/autorun.sh//'`

echo_rootright()
{
	if [ ! `whoami` = "root" ] ; then
		echo "****************************************************"
		echo "Warning:  You must run the process by 'root' user !"
		echo "          Try: sudo \"$0\"					     "
		echo ""
		echo "Process Terminated "
		echo "****************************************************"
		exit
	fi
}


echo_rootright
sh "${CURRENT_PATH}"/install_linux



