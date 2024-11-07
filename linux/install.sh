#!/bin/bash
echo ""

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


source ./utils.sh
echo "Running as root"
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

