function hg_ahead -a ahead behind diverged none
	if not hg_is_repo
		return 1
	end

	command hg summary --remote | grep "remote: " | cut -d: -f 2 | xargs | command awk "
        /\(synced\)/                           { print \"$none\"       ? \"$none\"     : \"\";     exit 0 }
        /1 or more incoming, [0-9]+ outgoing/  { print \"$diverged\"   ? \"$diverged\" : \"±\";    exit 0 }
        /1 or more incoming/                   { print \"$behind\"     ? \"$behind\"   : \"-\";    exit 0 }
        /[1-9]+ outgoing/                      { print \"$ahead\"      ? \"$ahead\"    : \"+\";    exit 0 }
	"
end
