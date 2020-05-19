function fd --description "Find folder by name and cd in"
  set folder (find . -maxdepth 4 -type d | fzf)
  cd $folder
end
