# UFW
set ufw_commands = "enable disable reload reset status version default allow deny reject limit"
complete -f -c ufw -n 'not __fish_seen_subcommand_from $ufw_commands' -a enable -d 'enables the firewall'
complete -f -c ufw -n 'not __fish_seen_subcommand_from $ufw_commands' -a disable -d 'disables the firewall'
complete -f -c ufw -n 'not __fish_seen_subcommand_from $ufw_commands' -a reload -d 'reload firewall'
complete -f -c ufw -n 'not __fish_seen_subcommand_from $ufw_commands' -a reset -d 'reset the firewall'
complete -f -c ufw -n 'not __fish_seen_subcommand_from $ufw_commands' -a status -d 'show firewall status'
complete -f -c ufw -n 'not __fish_seen_subcommand_from $ufw_commands' -a version -d 'display version information'
complete -f -c ufw -n 'not __fish_seen_subcommand_from $ufw_commands' -a default -d 'set default policy'
complete -f -c ufw -n 'not __fish_seen_subcommand_from $ufw_commands' -a allow -d 'add allow rule'
complete -f -c ufw -n 'not __fish_seen_subcommand_from $ufw_commands' -a deny -d 'add deny rule'
complete -f -c ufw -n 'not __fish_seen_subcommand_from $ufw_commands' -a reject -d 'add reject rule'
complete -f -c ufw -n 'not __fish_seen_subcommand_from $ufw_commands' -a limit -d 'add limit rule'


# Status
set status_commands = "verbose numbered"
complete -f -c ufw -n '__fish_seen_subcommand_from status; and not __fish_seen_subcommand_from $status_commands' -a verbose -d 'show verbose firewall status'
complete -f -c ufw -n '__fish_seen_subcommand_from status; and not __fish_seen_subcommand_from $status_commands' -a numbered -d 'show firewall status as numbered list of RULES'

# Default
set default_opts 'allow deny reject'
complete -f -c ufw -n '__fish_seen_subcommand_from default' -a $default_opts
complete -f -c ufw -n '__fish_seen_subcommand_from default; and __fish_seen_subcommand_from $default_opts' -a 'incoming outgoing routed'

