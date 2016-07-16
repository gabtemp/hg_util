set -l path $DIRNAME/.t-$TESTNAME-(random)

function -S setup
    mkdir -p $path/{default,branch,defaulttag,branchtag}

    for name in default branch defaulttag branchtag
    	cd $path/$name
        command hg --quiet init

        if test "$name" = "branch"
           or test "$name" = "branchtag"
	    	command hg --quiet branch $name
	    end

        touch file
    	command hg --quiet add file
    	command hg --quiet ci -m "file" -u "Test"
    end
	
	cd $path/defaulttag
    command hg --quiet tag tag
    command hg up --quiet tag
    
    cd $path/branchtag
    command hg --quiet tag tag
    command hg up --quiet tag
end

function -S teardown
    rm -rf $path
end

test "$TESTNAME - Get the name of the current (default) HG branch with no tag (tip)"
    "default" = (cd $path/default; hg_branch_name)
end

test "$TESTNAME - Get the name of the current HG branch with no tag (tip)"
    "branch" = (cd $path/branch; hg_branch_name)
end

test "$TESTNAME - Get the name of the current tag with no with no branch (default)"
    "tag" = (cd $path/defaulttag; hg_branch_name)
end

test "$TESTNAME - Get the name of the current HG branch and tag"
    "branchtag|tag" = (cd $path/branchtag; hg_branch_name)
end
