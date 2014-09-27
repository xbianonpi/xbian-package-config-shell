if grep -qx '1' /home/xbian/.xbian-config-start; then
    sudo xbian-config
    echo
    echo '# to disable xbian-config:'
    echo 'echo 0 > ~/.xbian-config-start'
fi

