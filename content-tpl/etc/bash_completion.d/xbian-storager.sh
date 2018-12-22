_xbian_storager()
{
        local cur prev opts
        COMPREPLY=();
        cur="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD-1]}"
        if [ "${prev}" == "rollback" -o "${prev}" == "destroy" ]; then
                arguments=$(xbian-storager list 2>&1 | grep -v '/@$\|^WARNING\:');
                COMPREPLY=($(compgen -W "${arguments}" -- $cur))
                return 0;
        elif [ "${COMP_WORDS[COMP_CWORD-2]}" != "xbian-storager" ]; then
                opts=$(echo "list snapshot rename destroy listvol rollback createvol xbiancopy backuphome mount umount compress");
                COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
                return 0;
        fi
}
complete -F _xbian_storager xbian-storager

_btrfs-auto-snapshot()
{
        local cur prev opts
        COMPREPLY=();
        cur="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD-1]}"
        if [ "${prev}" == "rollback" -o "${prev}" == "destroy" ]; then
                arguments=$(btrfs-auto-snapshot list 2>&1 | grep -v '/@$\|^WARNING\:');
                COMPREPLY=($(compgen -W "${arguments}" -- $cur))
                return 0;
        elif [ "${COMP_WORDS[COMP_CWORD-2]}" != "btrfs-auto-snapshot" ]; then
                opts=$(echo "list snapshot rename destroy listvol rollback createvol xbiancopy backuphome");
                COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
                return 0;
        fi
}
complete -F _btrfs-auto-snapshot btrfs-auto-snapshot

_xbian_snapper()
{
        local cur prev opts
        COMPREPLY=();
        cur="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD-1]}"
        if [ "${prev}" == "rollback" -o "${prev}" == "destroy" ]; then
                arguments=$(xbian-snapper list 2>&1 | grep -v '/@$\|^WARNING\:');
                COMPREPLY=($(compgen -W "${arguments}" -- $cur))
                return 0;
        elif [ "${COMP_WORDS[COMP_CWORD-2]}" != "xbian-snapper" ]; then
                opts=$(echo "list snapshot rename destroy listvol rollback mount umount");
                COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
                return 0;
        fi
}
complete -F _xbian_snapper xbian-snapper
