function hg_branch_name -d "Get the name of the current HG branch"
    set -l branch_name (command hg branch)

    if test -n "$branch_name"
        printf "%s\n" "$branch_name"
    end
end
