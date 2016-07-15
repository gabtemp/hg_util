function hg_untracked_files -d "Get the number of untracked files in a repository"
    if not hg_is_repo
        return 1
    end
    
    set -l count (command hg status --unknown ^ /dev/null | wc --lines)
    echo $count
    test 0 -eq "$count"; and return 1; or return 0
end
