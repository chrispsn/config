#! /bin/bash

for bundle in MatchTag csapprox ctrlp.vim neocomplcache nerdcommenter nerdtree syntastic vim-indent-guides vim-powerline vim-surround vundle; do
    git rm --cached .vim/bundle/${bundle}
done
