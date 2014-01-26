_btrfs-auto-snapshot()
{
        local cur prev opts
        COMPREPLY=();
        cur="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD-1]}"
        if [ "${prev}" == "rollback" ]; then
                arguments=$(btrfs-auto-snapshot list);
                COMPREPLY=($(compgen -W "${arguments}" -- $cur))
                return 0;
        elif [ "${COMP_WORDS[COMP_CWORD-2]}" != "btrfs-auto-snapshot" ]; then
                opts=$(echo "list snapshot rename destroy listvol rollback createvol xbiancopy backuphome");
                COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
                return 0;
        fi
}
complete -F _btrfs-auto-snapshot btrfs-auto-snapshot
