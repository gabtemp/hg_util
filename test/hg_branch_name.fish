set -l path $DIRNAME/.t-$TESTNAME-(random)

function -S setup
    mkdir -p $path/{default,branch}

    for name in default branch
    	cd $path/$name
        command hg --quiet init
        command hg --quiet branch $name
    end
end

function -S teardown
    rm -rf $path
end

test "$TESTNAME - Get the name of the current (default) HG branch"
    "default" = (cd $path/default; hg_branch_name)
end

test "$TESTNAME - Get the name of the current HG branch"
    "branch" = (cd $path/branch; hg_branch_name)
end
