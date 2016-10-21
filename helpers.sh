# Would you mind to write me properly? ñ.ñ

namePrefix="jl_"

master="master"
develop="develop"

Red="\033[0;31m"
White='\033[37m'

function git_branch_off
{
	if [ "$2" && "$3" ]; then
    git fetch origin "$3":"$3"
		git checkout -b "$1$namePrefix$2" "$3"
	fi
}

if [[ "$1" == 'feature' ]]; then
	if [[ "$2" ]]; then
		git_branch_off "feature/" "$2" "$develop"
	fi
	if ! [[ "$2" ]]; then
		echo $Red
		echo "Please provide a feature name!"
		echo $White
	fi
fi

if [[ "$1" == 'hotfix' ]]; then
	if [[ "$2" ]]; then
		git_branch_off "hotfix/" "$2" "$master"
	fi
	if ! [[ "$2" ]]; then
		echo $Red
		echo "Please provide a hotfix name!"
		echo $White
	fi
fi
