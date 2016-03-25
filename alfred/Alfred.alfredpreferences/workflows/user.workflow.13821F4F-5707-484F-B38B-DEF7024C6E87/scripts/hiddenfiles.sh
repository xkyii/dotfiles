#!/bin/sh

#check the version of osx
VERSION=$(sw_vers -productVersion)
OSX=${VERSION%\.*}
echo $OSX
#check user input
VAR=$1
if [ -z $VAR ]; then
	if [ "$OSX" = "10.8" ] || [ "$OSX" = "10.9" ] || [ "$OSX" = "10.10" ]; then
		CURVALUE=$(defaults read com.apple.finder AppleShowAllFiles -bool)
	else
		CURVALUE=$(defaults read com.apple.Finder AppleShowAllFiles -bool)
	fi
	if [ $CURVALUE = 0 ]; then
		if [ "$OSX" = "10.8" ] || [ "$OSX" = "10.9" ] || [ "$OSX" = "10.10" ]; then
			defaults write com.apple.finder AppleShowAllFiles -bool true
		else
			defaults write com.apple.Finder AppleShowAllFiles -bool true
		fi
		echo "Hidden files are now visible!"
		killall Finder
	else
		if [ "$OSX" = "10.8" ] || [ "$OSX" = "10.9" ] || [ "$OSX" = "10.10" ]; then
			defaults write com.apple.finder AppleShowAllFiles -bool false
		else
			defaults write com.apple.Finder AppleShowAllFiles -bool false
		fi
		echo "Hidden files are now hidden!"
		killall Finder
	fi
elif [ "$VAR" = "false" ] || [ "$VAR" = "f" ]; then
	if [ "$OSX" = "10.8" ] || [ "$OSX" = "10.9" ] || [ "$OSX" = "10.10" ]; then
		defaults write com.apple.finder AppleShowAllFiles -bool true
	else
		defaults write com.apple.Finder AppleShowAllFiles -bool true
	fi
	echo "Hidden files are now visible!"
	killall Finder
elif [ "$VAR" = "true" ] || [ "$VAR" = "t" ]; then
	if [ "$OSX" = "10.8" ] || [ "$OSX" = "10.9" ] || [ "$OSX" = "10.10" ]; then
		defaults write com.apple.finder AppleShowAllFiles -bool false
	else
		defaults write com.apple.Finder AppleShowAllFiles -bool false
	fi
	echo "Hidden files are now hidden!"
	killall Finder
else
	echo "Command "$VAR" not found!"
fi
