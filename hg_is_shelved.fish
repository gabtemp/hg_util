function hg_is_shelved
    if not hg_is_repo
        return 1
    end

    test 0 -eq (command hg shelve --list ^ /dev/null | wc --lines); and return 1; or return 0
end