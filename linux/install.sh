#!/bin/bash
echo ""

function runCommand(){
	commandString="$1"
		echo "Command "${commandString}""
	if [ -z "$commandString" ]; then
		echo "Empty command!"
		return 1
	fi
	eval ${commandString}
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
	fi
	exit $? 
}
function runOptionalCommand(){
	runCommand "$1"
	if [ $? -ne 0 ]; then
		echo "But execution will go on"
	fi
	return 0
}

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Running as root"
echo "Initital install"
#empty
runOptionalCommand
#optional
runOptionalCommand "cd /FOOO"
#normal
runImportantCommand "echo pipi und kaki"
#normal must fail
runImportantCommand "cd /FOOO"
#not reachable
runOptionalCommand "echo in pipikakaland"
