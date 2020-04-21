function udel
  set rule_id (sudo ufw status numbered | sed -e 's/\[ /\[/g' | sed -Ee 's/\s{2,}/  /g' | awk -F"  " '{if (NR > 4 && NF > 1) {printf "%-25s%-11s%-20s%s\n", $1,$2,$3,$4}}' | fzf | awk -F"(\[|\])" '{print $2}')
  sudo ufw delete $rule_id
end
