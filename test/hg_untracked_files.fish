set -l path $DIRNAME/.t-$TESTNAME-(random)

function -S setup
	mkdir -p $path/{tracked,untracked,empty}

    for name in tracked untracked
        cd $path/$name
	    command hg --quiet init
	    for i in (seq 5)
	    	touch file_$i
	    end
    end
    cd $path/tracked
    command hg --quiet add *
end

function -S teardown
    rm -rf $path
end

test "$TESTNAME - Test if there is no untracked file"
    "0:1" = (
        pushd $path/tracked
        set -l count (hg_untracked_files)
        echo "$count:$status"
        popd
        )
end

test "$TESTNAME - Test if there are untracked files"
    "5:0" = (
        pushd $path/untracked
        set -l count (hg_untracked_files)
        echo "$count:$status"
        popd
        )
end

test "$TESTNAME - Test if there are untracked files"
    ":1" = (
        pushd $path/empty
        set -l count (hg_untracked_files)
        echo "$count:$status"
        popd
        )
end

