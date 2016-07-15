set -l path $DIRNAME/.t-$TESTNAME-(random)

function -S setup
    mkdir -p $path/repo/long/ass/path/still/in/the/repository
    mkdir -p $path/not-repo
    cd $path/repo
    command hg --quiet init
end

function -S teardown
    rm -rf $path
end

test "$TESTNAME - Test the root directory of a HG repository"
    "$path/repo" = (
        pushd $path/repo
        echo (hg_repository_root)
        popd
        )
end

test "$TESTNAME - Test the root directory of a HG repository in a deep path"
    "$path/repo" = (
        pushd $path/repo/long/ass/path/still/in/the/repository
        echo (hg_repository_root)
        popd
        )
end

test "$TESTNAME - Test if a directory is not a HG repository"
    1 -eq (
        pushd $path/not-repo
        hg_repository_root
        echo $status
        popd
        )
end
