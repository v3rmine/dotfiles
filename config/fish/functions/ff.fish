function ff --description "Find in files"
  set loc (rg --max-depth=4 --hidden --no-line-number "" . | eval "fzf $FZF_DEFAULT_OPTS --header='[find:file]'" | tr ':' ' ' | awk '{print $1}')
  echo "Query is in $loc"
  cd (dirname $loc)
end
