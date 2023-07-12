eval "$(rbenv init -)"

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo ' ('$branch')'
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
prompt='%2/$(git_branch_name) %% '

PATH=$PATH:~/.pub-cache/bin:$PATH

# Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/14/bin"
# PHP, Composer, Laravel
export PATH="$PATH:~/.composer/vendor/bin"

alias bers="bundle exec rspec"
alias setup="bundle install && rails db:{drop,create,migrate,seed}"
alias feat="bundle exec rspec spec/features"
alias mod="bundle exec rspec spec/models"
alias tests="bundle exec rspec spec/features && bundle exec rspec 
spec/models"
alias cdt="cd ~/turing"
alias cov="open coverage/index.html"
alias weather="curl -s wttr.in/columbus"
alias aliases="code ~/.zshrc"
alias phpi="code /opt/homebrew/etc/php/8.2/php.ini"
alias gs="git status"

function gc {
  git add . && git commit -m "$1"
}

function clopen {
   git clone "$1" $2 && code $2
}

function herokuname {
  #!usr/bin/env ruby
  ruby /Users/chrissimmons/turing/herokuname.rb
}

