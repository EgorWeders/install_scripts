#!/bin/bash
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

#very basic tools such as packet manager
function essentialsInstall(){
	echo "Installing essentials"
	runImportantCommand "type ip"
	runImportantCommand "type ip"
}

#ipconfig , proxies setting
function netToolsInstall(){
		echo "Installing net tools..."
}

#zsh etc.
function cliToolsInstall(){
		echo "Installing cli tools..."
}
#configure installed basic tools
function configureBasic(){
		echo "Configure basic tools..."
}

#entry for basic install
function installBasic(){
	echo "Initital basic install..."
	essentialsInstall
	netToolsInstall
	cliToolsInstall
	configureBasic
	echo "Basic install complete"
}