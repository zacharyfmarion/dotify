##### USER CONFIG #####
alias back="cd .."
alias home="cd ~"

# folder shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias dv="cd ~/Developer"

# reload zsh config
alias reload!='. ~/.zshrc'

alias cls='clear'

alias spotoff="sudo mdutil -a -i off" # Disable Spotlight
alias spoton="sudo mdutil -a -i on" # Enable Spotlight

############### MISCELLANEOUS ###############

#update OS software, ruby, brew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

# Displaying files as a tree recursively
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

# Use python3 by default
alias python="python3"
alias pip="pip3"

# JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc";
[ -e "${jscbin}" ] && alias jsc="${jscbin}";
unset jscbin;

# trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

#get IP address
alias localip="ipconfig getifaddr en0"

#lock the screen
alias lksc="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# volume
alias stfu="osascript -e 'set volume output muted true'"
alias uptop="osascript -e 'set volume output volume 100'"

#recursively delete DS_Store files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"