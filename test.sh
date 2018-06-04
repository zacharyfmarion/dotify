#!/usr/bin/env zsh
source resources.sh

running "downloading oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [[ $? != 0 ]]; then
  error "unable to install oh-my-zsh -> quitting setup"
  exit 2
fi
ok

# hard link .zshrc
running "Appending to your .zshrc!"
cat config/.zshrc >> ~/.zshrc
ok

running "installing zsh-syntax-highlighting and adding it to the plugin list"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sed -i '' -e 's/^plugins=(/plugins=(\'$'\n  zsh-syntax-highlighting/g' ~/.zshrc
ok

running "sourcing zshrc"
source ~/.zshrc
ok