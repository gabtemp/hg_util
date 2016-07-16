function hg_branch_name -d "Get the name of the current HG branch"
    if not hg_is_repo
        return 1
    end

    set -l branch_name (command hg branch)
    
    if test -n "$branch_name"
    	set -l tag_name (command hg log -r "." --template "{tags}")
    	

    	if test -z "$tag_name"
    	   or test "tip" = "$tag_name"
    		printf "%s\n" "$branch_name"
    	else
    		if test "default" = "$branch_name"
    			printf "%s\n" "$tag_name"
    		else
				printf "%s|%s\n" "$branch_name" "$tag_name"
			end
    	end
    end
end
