set -l path $DIRNAME/.t-$TESTNAME-(random)

function -S setup
    mkdir -p $path/empty
    mkdir -p $path/not-empty
    
    cd $path/not-empty
    command hg init
    touch file
    command hg add file
    command hg commit -m "commit" -u "user"
end

function -S teardown
    rm -rf $path
end

test "$TESTNAME - Test not empty repository"
    1 -eq (
	    pushd $path/not-empty
        hg_is_empty
        echo $status
        popd
        )
end

test "$TESTNAME - Test empty repository"
    0 -eq (
	    pushd $path/empty
        hg_is_empty
        echo $status
        popd
        )
end
