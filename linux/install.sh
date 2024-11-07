#!/bin/bash
echo ""
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#ipconfig , proxies setting
function netToolsInstall(){
		echo "Installing net tools..."
		runImportantCommand "apt install net-tools"
}

#zsh, mc etc.
function cliToolsInstall(){
		echo "Installing cli tools..."
		runImportantCommand "apt install make"
		runImportantCommand "apt install htop"
		runImportantCommand "apt install zsh"
}
#configure installed basic tools
function configureBasic(){
		echo "Configure basic tools..."
}#ipconfig , proxies setting
function netToolsInstall(){
		echo "Installing net tools..."
		runImportantCommand "apt install net-tools"
}

#zsh, mc etc.
function cliToolsInstall(){
		echo "Installing cli tools..."
		runImportantCommand "apt install make"
		runImportantCommand "apt install htop"
		runImportantCommand "apt install zsh"
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

#entry for basic install
function installBasic(){
	echo "Initital basic install..."
	essentialsInstall
	netToolsInstall
	cliToolsInstall
	configureBasic
	echo "Basic install complete"
}
source ./utils.sh
echo "Running as root"
echo ""
echo "System info"
echo ""
hostnamectl
echo ""
lsb_release -a
echo ""
echo "Initital install"
installBasic

#Tests
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

