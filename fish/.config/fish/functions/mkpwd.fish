function mkpwd
    if test (count $argv) -eq 0
        set length 16
    else
        set length $argv[1]
    end

    head -3 /dev/urandom | tr -cd '[:alnum:]' | cut -c -$length
end
