#!/bin/sh
function gco
{
	branch_name=$(git symbolic-ref -q HEAD)
        branch_name=${branch_name##refs/heads/}
	branch_name=${branch_name:-HEAD}
	echo $branch_name
	
# add
	git add -A
# commit
	read -p "Commit message: " commitMessage
	git commit -m "$commitMessage"
}
gco




