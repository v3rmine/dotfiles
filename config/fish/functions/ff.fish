function ff --description "Find file"
  vim (fd | sk -q "$argv[1]")
end
