function git-stash-apply --description "Super git stash"
  git stash apply (git stash list | sk -q "$argv" | awk -F': ' '{print $1}')
end
