#!/usr/bin/env bash
#{{{                    MARK:Header
#**************************************************************
#####   Author: JACOBMENKE
#####   Date: Thu Apr 12 00:02:45 EDT 2018
#####   Purpose: bash script to 
#####   Notes: 
#}}}***********************************************************

dir="$HOME/forkedRepos/customTerminalInstaller"
moredir="$HOME/.oh-my-zsh/custom/plugins/zsh-more-completions"

main(){
        git reset --hard
        git pull --force
        git reset --hard origin/master
		cp .shell_aliases_functions.sh "$HOME"
		cp .zshrc "$HOME"
		cp .vimrc "$HOME"
		cp .tmux.conf "$HOME"
		cp conf.gls "$HOME"
		cp conf.df "$HOME"
		cp conf.ifconfig "$HOME"
		cp grc.zsh "$HOME"
		cp .inputrc "$HOME"
		cp -R .tmux/* "$HOME/.tmux"
		cp -f scripts/* "$SCRIPTS"

    }

while [[ 1 ]]; do

    cd "$dir" || { echo "Directory $dir does not exist" >&2 && exit 1; }
    git fetch origin
    output=$(git log HEAD..origin/master --oneline)

    if [[  ! -z "$output" ]] ; then
        echo "We have change to $(git remote -v)"
        main
    else
        :
    fi

    cd "$moredir" || { echo "Directory $moredir does not exist" >&2 && exit 1; }
    git fetch origin
    output=$(git log HEAD..origin/master --oneline)

    if [[  ! -z "$output" ]] ; then
        echo "We have change to $(git remote -v)"
        git reset --hard
        git pull --force
        git reset --hard origin/master
    else
        :
    fi
    sleep 5
done

