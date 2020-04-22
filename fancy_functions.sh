#!/bin/sh
function gco
{
	branch_name=$(git symbolic-ref -q HEAD)
        branch_name=${branch_name##refs/heads/}
	branch_name=${branch_name:-HEAD}
	echo $branch_name
	git add .
	git commit -m $1
}
gco




