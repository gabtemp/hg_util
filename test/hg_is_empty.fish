set -l path $DIRNAME/.t-$TESTNAME-(random)

function -S setup
    mkdir -p $path/{empty,notempty}
    
    for name in empty notempty
        cd $path/$name
        command hg --quiet init
    end
    cd $path/notempty
    touch file
    command hg --quiet add file
    command hg --quiet commit -m "commit" -u "user"
end

function -S teardown
    rm -rf $path
end

test "$TESTNAME - Test not empty repository"
    1 -eq (
	    pushd $path/notempty
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
