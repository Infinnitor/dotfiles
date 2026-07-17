set fish_greeting ""

if status is-interactive
	alias l="ls -1Ah"
	alias q="exit"

    # Commands to run in interactive sessions can go here
end

source ~/.nix-profile/etc/profile.d/nix.fish

export PATH="$PATH:/home/computer/.local/bin/"

# function zellij_tab_name_update --on-variable _zellijtab
# 	if set -q ZELLIJ
# 		set tabname $(zellij action dump-layout | grep "tab name=" | wc -l)
# 		command nohup zellij action rename-tab $tabname >/dev/null 2>&1 &
# 	end
# end
#
# set _zellijtab
