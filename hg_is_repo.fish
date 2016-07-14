function hg_is_repo -d "Test if the current directory is a HG repository"
    if not hg_repository_root > /dev/null ^ /dev/null
        return 1
    end
end
