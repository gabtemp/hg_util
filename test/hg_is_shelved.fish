set -l path $DIRNAME/.t-$TESTNAME-(random)

function -S setup
    mkdir -p $path/{shelved,notshelved,uninstalled,notrepo}
    
    for name in shelved notshelved uninstalled
        cd $path/$name
        command hg --quiet init
        touch file
    	command hg --quiet add file
    end

    echo -e "\n[extensions]\nshelve=\n" >> $path/shelved/.hg/hgrc
    echo -e "\n[extensions]\nshelve=\n" >> $path/notshelved/.hg/hgrc
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

test "$TESTNAME - Test repository with hg shelve uninstalled"
    1 -eq (
	    pushd $path/uninstalled
        hg_is_shelved
        echo $status
        popd
        )
end

test "$TESTNAME - Test hg shelve outside repository"
    1 -eq (
	    pushd $path/notrepo
        hg_is_shelved
        echo $status
        popd
        )
end
