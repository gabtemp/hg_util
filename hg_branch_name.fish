function hg_branch_name -d "Get the name of the current HG branch"
    if not hg_is_repo
        return 1
    end

    set -l branch_name (command hg branch)
    if test -n "$branch_name"
        printf "%s\n" "$branch_name"
    end
end
