#!/bin/bash
# このスクリプトはだいたい qiita @okamos - ミニマルに始めるDotfiles自動化計画 から引用されています

# === FUNCTION ===

has() {
    type "$1" > /dev/null 2>&1
}


