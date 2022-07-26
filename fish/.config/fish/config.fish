if status is-interactive
    # Commands to run in interactive sessions can go here
    
    # Set variables
    set fish_greeting
    set EDITOR nvim

    theme_gruvbox dark medium

    # ~/.cargo/bin/client


    ##nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && bass source "$NVM_DIR/nvm.sh"  # This loads nvm

    . ~/.config/fish/fish/aliases.fish
    


    ## Tux greets you
    cowgreet tux

    
    starship init fish | source
end
