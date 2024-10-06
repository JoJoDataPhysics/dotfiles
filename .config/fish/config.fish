if status is-interactive
    # Commands to run in interactive sessions can go here
end
fzf --fish | source

fish_add_path ~/bin

function ranger-cd
  set tempfile '/tmp/chosendir'
  ranger --choosedir=$tempfile (pwd)
  if test -f $tempfile
      if [ (cat $tempfile) != (pwd) ]
        cd (cat $tempfile)
      end
  end
  rm -f $tempfile
end

alias nvim-kick="env NVIM_APPNAME=nvim_kickstart nvim"
alias nvim-chad="env NVIM_APPNAME=nvim_nvchad nvim"
alias nvim-lsp="env NVIM_APPNAME=nvim_lsp nvim"
alias nvim-no-for="env NVIM_APPNAME=nvim_no_format_on_save nvim"

function nvims
    set items "default" "nvim_lsp" "nvim_no_format_on_save" "nvim_kickstart" "nvim_nvchad" "vanilla" 
    set config (printf '%s\n' $items | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)

    if test -z "$config"
        echo "Nothing selected"
        return 0
    end

    if test "$config" = "vanilla"
        set config ""
    end

    if test "$config" = "default"
        set config "nvim_lsp"
    end

    env NVIM_APPNAME=$config nvim $argv
end

alias n nvim-lsp
alias cd z
alias ls lsd
alias cat bat
alias lg 'lazygit'
alias r 'ranger-cd'
alias .. 'cd ..'
alias ... 'cd ../..'
alias l 'lsd -al'
zoxide init fish | source
