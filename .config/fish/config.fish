function fish_greeting
	~/.config/pfetch/run.sh
end

if status is-interactive
	alias l="ls -a --color"
	alias gs="git status"
	alias gd="git diff"
	alias ga="git add"
	alias gc="git commit"
	alias so="source ~/.config/fish/config.fish"

	alias runvalgrind="valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes"

	alias blight="sudo ~/Repos/BLight/bin/Release/net6.0/BLight"

	alias py="pypy3"

	set -gx PATH $PATH ~/opt/cross/bin ~/.dotnet/tools
	set EDITOR nvim /usr/bin/nvim

	# set HTTP_PROXY "127.0.0.1:3128"
	# set HTTPS_PROXY "127.0.0.1:3128"
end
