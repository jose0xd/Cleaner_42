#!/bin/bash
#Author Omar BOUYKOURNE
#42login : obouykou

#banner
echo -e	"\n"
echo -e	" 		█▀▀ █▀▀ █░░ █▀▀ ▄▀█ █▄░█ "
echo -e	" 		█▄▄ █▄▄ █▄▄ ██▄ █▀█ █░▀█ "
echo -en "\n    	    	   By: "
echo -e "\033[33mOMBHD\033[0m [𝒐𝒃𝒐𝒖𝒚𝒌𝒐𝒖]\n"

sleep 2

#update
if [ "$1" == "update" ];
then
	tmp_dir=".issent_wakha_daguis_t9ddart_ghina_ard_trmit_orra_tskert_zond_ism_yad_ikan_repo_gh_desktop_nk_achko_awldi_4ayad_yogguer_l'encrypting_n_2^10000_ghayad_aras_tinin_t''a.*\l7i?t_agmano_mohmad"
	if ! git clone --quiet https://github.com/jose0xd/Cleaner_42.git "$HOME"/"$tmp_dir" &>/dev/null;
	then
		sleep 0.5
		echo -e "\033[31m\n           -- Couldn't update CCLEAN! :( --\033[0m"
		echo -e "\033[33m\n   -- Maybe you need to change your bad habits XD --\n\033[0m"
		exit 1
	fi
	sleep 1
	if [ "" == "$(diff "$HOME"/Cleaner_42.sh "$HOME"/"$tmp_dir"/Cleaner_42.sh)" ];
	then
		echo -e "\033[33m\n -- You already have the latest version of cclean --\n\033[0m"
		/bin/rm -rf "$HOME"/"${tmp_dir:?}"
		exit 0
	fi
	cp -f "$HOME"/"$tmp_dir"/Cleaner_42.sh "$HOME" &>/dev/null
	/bin/rm -rf "$HOME"/"${tmp_dir:?}" &>/dev/null
	echo -e "\033[33m\n -- cclean has been updated successfully --\n\033[0m"
	exit 0
fi
#calculating the current available storage
Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')
if [ "$Storage" == "0BB" ];
then
	Storage="0B"
fi
echo -e "\033[33m\n -- Available Storage Before Cleaning : || $Storage || --\033[0m"

echo -e "\033[31m\n -- Cleaning ...\n\033[0m "


should_log=0
if [[ "$1" == "-p" || "$1" == "--print" ]]; then
	should_log=1
fi

function clean_glob {
	# don't do anything if argument count is zero (unmatched glob).
	if [ -z "$1" ]; then
		return 0
	fi

	if [ $should_log -eq 1 ]; then
		for arg in "$@"; do
			du -sh "$arg" 2>/dev/null
		done
	fi

	/bin/rm -rf "$@" &>/dev/null

	return 0
}

function clean {
	# to avoid printing empty lines
	# or unnecessarily calling /bin/rm
	# we resolve unmatched globs as empty strings.
	shopt -s nullglob

	echo -ne "\033[38;5;208m"

	#Trash
	clean_glob "$HOME"/.local/share/Trash/*

	#General Caches files
	# clean_glob "$HOME"/.cache/*

	#Slack, Discord, Firefox and VSCode
	clean_glob "$HOME"/snap/slack/common/.cache/*
	clean_glob "$HOME"/snap/discord/common/.cache/*
	clean_glob "$HOME"/snap/firefox/common/.cache/*
	clean_glob "$HOME"/snap/code/common/.cache/*
	clean_glob "$HOME"/.config/Code/Cache/*
	clean_glob "$HOME"/.config/Code/CachedData/*
	clean_glob "$HOME"/.config/Code/Crashpad/completed/*
	clean_glob "$HOME"/.config/Code/User/workspaceStorage/*

	#Chrome
	clean_glob "$HOME"/.config/google-chrome/Default/Service Worker/CacheStorage/*
	clean_glob "$HOME"/.config/google-chrome/Profile\ [0-9]/Service Worker/CacheStorage/*
	clean_glob "$HOME"/.config/google-chrome/Profile\ [0-9]/Cache/*
	clean_glob "$HOME"/.config/google-chrome/Profile\ [0-9]/Code\ Cache/*
	clean_glob "$HOME"/.config/google-chrome/Default/Cache/*
	clean_glob "$HOME"/.config/google-chrome/Default/Code\ Cache/*
	clean_glob "$HOME"/.config/google-chrome/Crash\ Reports/completed/*

	echo -ne "\033[0m"
}
clean

if [ $should_log -eq 1 ]; then
	echo
fi

#calculating the new available storage after cleaning
Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')
if [ "$Storage" == "0BB" ];
then
	Storage="0B"
fi
sleep 1
echo -e "\033[32m -- Available Storage After Cleaning : || $Storage || --\n\033[0m"

echo -e	"\n	       report any issues to me in:"
echo -e	"		   GitHub   ~> \033[4;1;34mjose0xd\033[0m"
echo -e	"	   	   42 Slack ~> \033[4;1;34mjarredon\033[0m\n"

#installer
