function read_confirm --description 'Ask the user for confirmation' --argument-names prompt default
    if test -z "$prompt"
        set prompt 'Continue?'
    end

    while true
        switch "$default"
            case Y y
                set display '[Y/n]'
                set confirm 'y'
            case '' N n
                set display '[y/N]'
                set confirm 'n'
        end

        read -p 'set_color green; echo -n "$prompt $display: "; set_color normal' confirm

        if test -z "$confirm"
            switch $default
                case Y y
                    set confirm 'y'
                case '' N n
                    set confirm 'n'
            end
        end

        switch "$confirm"
            case Y y
                return 0
            case N n
                return 1
        end
    end
end
