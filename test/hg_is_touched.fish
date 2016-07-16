set -l path $DIRNAME/.t-$TESTNAME-(random)

function -S setup
    mkdir -p $path/{foo,bar,baz}

    for name in foo bar baz
        cd $path/$name
        echo $name > $name
        command hg --quiet init
        command hg --quiet add $name
    end

    echo dirty > $path/foo/foo

    command hg --quiet -R $path/bar ci -m "Clean" -u "Test"
    command hg --quiet -R $path/baz ci -m "Clean" -u "Test"

    echo untracked > $path/baz/untracked
end

function -S teardown
    rm -rf $path
end

test "$TESTNAME - Test if there are any changes in the working tree #1"
    0 -eq (
        pushd $path/foo
        hg_is_touched
        echo $status
        popd
        )
end

test "$TESTNAME - Test if there are any changes in the working tree #2"
    1 -eq (
        pushd $path/bar
        hg_is_touched
        echo $status
        popd
        )
end

test "$TESTNAME - Test if there are any changes in the working tree #3"
    0 -eq (
        pushd $path/baz
        hg_is_touched
        echo $status
        popd
        )
end

test "$TESTNAME - Test if there are any changes in the working tree #4"
    1 -eq (
        pushd $HOME
        hg_is_touched
        echo $status
        popd
        )
end
