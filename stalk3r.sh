#!/bin/bash
# stalk3r v1.0
# Author: @MzainiHasan
# https://github.com/MzainiHasan/stalk3r

# Reset
Color_Off='\[\e[0m\]'       # Text Reset

# Regular Colors
Black='\[\e[0;30m\]'        # Black
Red='\[\e[0;31m\]'          # Red
Green='\[\e[0;32m\]'        # Green
Yellow='\[\e[0;33m\]'       # Yellow
Blue='\[\e[0;34m\]'         # Blue
Purple='\[\e[0;35m\]'       # Purple
Cyan='\[\e[0;36m\]'         # Cyan
White='\[\e[0;37m\]'        # White

trap 'printf "\n";partial;exit 1' 2

banner() {

printf "                                                                                       \e[1;92m\e[0m\n"
printf "                                                                                       \e[0;31m\n"

printf " ________  _________  ________  ___       ___  __    ________  ________         \e[0;31m\n"
printf "|\   ____\|\___   ___\\   __  \|\  \     |\  \|\  \ |\_____  \|\   __  \        \e[0;31m\n"
printf "\ \  \___|\|___ \  \_\ \  \|\  \ \  \    \ \  \/  /|\|____|\ /\ \  \|\  \       \e[0;31m\n"
printf " \ \_____  \   \ \  \ \ \   __  \ \  \    \ \   ___  \    \|\  \ \   _  _\      \e[0;31m\n"
printf "  \|____|\  \   \ \  \ \ \  \ \  \ \  \____\ \  \\ \  \  __\_\  \ \  \\  \|     \e[0;31m\n"
printf "    ____\_\  \   \ \__\ \ \__\ \__\ \_______\ \__\\ \__\|\_______\ \__\\ _\     \e[0;31m\n"
printf "   |\_________\   \|__|  \|__|\|__|\|_______|\|__| \|__|\|_______|\|__|\|__|    \e[0;31m\n"
printf "   \|_________|                                                                 \e[0;31m\n"

printf "          \e[0;34mv1.0 Penulis Code: @MzainiHasan  \e[0m\e[0;34\n"
printf "                                                    \e[1;92m \e[0m\n"

}

partial() {

if [[ -e $username.txt ]]; then
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m %s.txt\n" $username
fi

}

scanner() {

read -p $'\e[1;92m[\e[0m\e[1;77m?\e[0m\e[1;92m] Input Username:\e[0m ' username

if [[ -e $username.txt ]]; then
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Removing previous file:\e[0m\e[1;77m %s.txt" $username
rm -rf $username.txt
fi
printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Checking username\e[0m\e[1;77m %s\e[0m\e[1;92m on: \e[0m\n" $username

## Facebook

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Facebook: \e[0m"
check_face=$(curl -s "https://www.facebook.com/$username" -L -H "Accept-Language: en" | grep -o 'not found'; echo $?)


if [[ $check_face == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.facebook.com/%s\n" $username
printf "https://www.facebook.com/%s\n" $username >> $username.txt
elif [[ $check_face == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## INSTAGRAM

check_insta=$(curl -s -H "Accept-Language: en" "https://www.instagram.com/$username" -L | grep -o 'The link you followed may be broken'; echo $?)
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Instagram: \e[0m"

if [[ $check_insta == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.instagram.com/%s\n" $username
printf "https://www.instagram.com/%s\n" $username > $username.txt
elif [[ $check_insta == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## TWITTER

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Twitter: \e[0m"
check_twitter=$(curl -s "https://www.twitter.com/$username" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)


if [[ $check_twitter == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.twitter.com/%s\n" $username
printf "https://www.twitter.com/%s\n" $username >> $username.txt
elif [[ $check_twitter == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## YOUTUBE

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] YouTube: \e[0m"
check_youtube=$(curl -s "https://www.youtube.com/$username" -L -H "Accept-Language: en" | grep -o 'Not Found'; echo $?)

if [[ $check_youtube == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.youtube.com/%s\n" $username
printf "https://www.youtube.com/%s\n" $username >> $username.txt
elif [[ $check_youtube == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi


partial
}
banner
scanner