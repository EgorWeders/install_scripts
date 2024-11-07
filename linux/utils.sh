#!/bin/bash
echo "Utils loaded"
function runCommand(){
	commandString="$1"
		echo "Command "${commandString}""
	if [ -z "$commandString" ]; then
		echo "Empty command!"
		return 1
	fi
	eval "${commandString}  > /dev/null"
	if [ $? -ne 0 ]; then
		echo "Command Failed"
		return 2
	fi
	return 0
}
function runImportantCommand(){
	runCommand "$1"
	if [ $? -ne 0 ]; then
		echo "Stop installing"
		exit $? 
	fi
	return $? 
}
function runOptionalCommand(){
	runCommand "$1"
	if [ $? -ne 0 ]; then
		echo "But execution will go on"
	fi
	return $? 
}





