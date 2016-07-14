function hg_is_empty -d "Test if a repository is empty"
    if hg_is_repo
        return (command hg log --limit 1 --template "{node}\n" ^ /dev/null | wc --lines)
    end
end
