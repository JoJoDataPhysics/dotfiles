cd ~
if status is-interactive
    # Commands to run in interactive sessions can go here
end

if type rg &> /dev/null
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
end

function fish_user_key_bindings
    fzf_key_bindings
end

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

fish_add_path /home/joerg/.local/bin
fish_add_path /home/joerg/miniconda3/condabin
fish_add_path /home/joerg/.local/bin

alias nvim-lsp="env NVIM_APPNAME=nvim_lsp nvim"

alias n nvim-lsp
alias python=python3
alias ls=lsd
alias python=python3
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cat=bat
alias r='ranger-cd'
alias v=nvim
alias lg='lazygit'
alias l='lsd -la'
alias cd..='z'
zoxide init fish | source
