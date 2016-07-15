set -l path $DIRNAME/.t-$TESTNAME-(random)

function -S setup
    mkdir -p $path/{shelved,notshelved}
    
    for name in shelved notshelved
        cd $path/$name
        command hg --quiet init
        touch file
    	command hg --quiet add file
    end

    cd $path/shelved
    command hg --quiet shelve
end

function -S teardown
    rm -rf $path
end

test "$TESTNAME - Test not shelved repository"
    1 -eq (
	    pushd $path/notshelved
        hg_is_shelved
        echo $status
        popd
        )
end

test "$TESTNAME - Test shelved repository"
    0 -eq (
	    pushd $path/shelved
        hg_is_shelved
        echo $status
        popd
        )
end
