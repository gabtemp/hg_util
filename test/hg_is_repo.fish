set -l path $DIRNAME/.t-$TESTNAME-(random)

function -S setup
    mkdir -p $path/repo
    mkdir -p $path/not-repo
    cd $path/repo
    command hg init
    mkdir -p long/ass/path/still/in/the/repository
end

function -S teardown
    rm -rf $path
end

test "$TESTNAME - Test if the root directory is a HG repository"
    0 -eq (
        pushd $path/repo
        hg_is_repo
        echo $status
        popd
        )
end

test "$TESTNAME - Test if a directory is a HG repository"
    0 -eq (
        pushd $path/repo/long/ass/path/still/in/the/repository
        hg_is_repo
        echo $status
        popd
        )
end

test "$TESTNAME - Test if a directory is not a HG repository"
    1 -eq (
        pushd $path/not-repo
        hg_is_repo
        echo $status
        popd
        )
end
