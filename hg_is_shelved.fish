function hg_is_shelved
    if not hg_is_repo
        return 1
    end

    set -l shelves (command hg shelve --list ^ /dev/null)
    if test 0 -ne $status
       or test -z "$shelves"
       return 1
    end

end