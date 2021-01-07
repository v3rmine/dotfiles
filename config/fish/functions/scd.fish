function scd --description "Super-CD use wd and skim to move faster"
  wd (wd list | tail -n +2 | awk '{if (length($2) > 0) print $2}' | sk -q "$argv")
end
