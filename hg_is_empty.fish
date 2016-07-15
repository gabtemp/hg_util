function hg_is_empty -d "Test if a repository is empty"
    if not hg_is_repo
        return 1
    end
    
    return (command hg log --limit 1 --template "{node}\n" ^ /dev/null | wc --lines)
end
