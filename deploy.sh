#!/bin/bash
# このスクリプトはだいたい qiita @okamos - ミニマルに始めるDotfiles自動化計画 から引用されています

# === VARIABLES === #

DOT_DIRECTORY = "${HOME}/dotfiles"

# === FUNCTION === #

# バイナリの存在確認
has() {
    type "$1" > /dev/null 2>&1
}

# === DEPLOY SCRIPTS === #

## === SYMBOLIC LINKING === ##

cd ${DOT_DIRECTORY}

for f in .??*
do
    # ignore some files
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitignore" ]] && continue
    [[ ${f} = "README.md" ]] && continue
    [[ ${f} = "deploy.sh" ]] && continue
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done
echo [$(tput setaf 2)✔︎$(tput sgr0)] deploy complete!
