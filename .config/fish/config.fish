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
	alias hx="helix"

	alias runvalgrind="valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes"

	alias blight="sudo ~/Repos/BLight/bin/Release/net6.0/linux-x64/BLight"

	alias py="pypy3"

	alias pipes="pipes.sh -K -p 10 -r 0"
	alias pipeslow="pipes.sh -K -p 5 -r 0 -f 50"

	set -gx PATH $PATH ~/opt/cross/bin ~/.dotnet/tools
	set EDITOR nvim /usr/bin/nvim

	set HTTP_PROXY ""
	set HTTPS_PROXY ""
end
