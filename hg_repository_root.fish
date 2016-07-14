function hg_repository_root -d "Get the top level directory of the current hg repository"
	set -l repo_root (lookup .hg) 
    if test $status -ne 0
        return 1
    end
    echo $repo_root
end
