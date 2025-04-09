#!/bin/sh
#bens aliases
#alias cd='pushd'
alias edithosts='sudo vim /etc/hosts'
addhost() { echo "127.0.0.1 $1" | sudo tee -a /etc/hosts; }
alias passgen='apg -m 24 -a 1 -M NCL'
alias passjs='node /var/www/local.local/htdocs/pass/pass.js'
alias bashreload='source ~/.bashrc'
alias bfg='java -jar /home/ben/bin/bfg.jar'
alias movepanel='xfconf-query -c xfce4-panel -p /panels/panel-0/output-name -s'
alias qrsync="rsync -azvhe ssh --exclude '*.pdf' --exclude '*.doc' --exclude '*.docx' --exclude '*.ppt' --exclude '*.pptx' --exclude '*.mp4' --exclude '*.mov' --exclude '*.flv' --exclude '*.tar.gz' --exclude '*.mp3' --exclude '*.swf' --exclude '*.m4v'"
alias qrsyncmirror="rsync --delete -azvhe ssh --exclude '*.pdf' --exclude '*.doc' --exclude '*.docx' --exclude '*.ppt' --exclude '*.pptx' --exclude ‘*.mp4’ --exclude ‘*.mov’ --exclude ‘*.flv’ --exclude '*.tar.gz' --exclude ‘*.mp3’ --exclude ‘*.swf’ --exclude ‘*.m4v’"
alias sudoqrsync="sudo rsync -azvhe ssh --exclude '*.pdf' --exclude '*.doc' --exclude '*.docx' --exclude '*.ppt' --exclude '*.pptx' --exclude ‘*.mp4’ --exclude ‘*.mov’ --exclude ‘*.flv’ --exclude '*.tar.gz' --exclude ‘*.mp3’ --exclude ‘*.swf’"
alias drupalcs="phpcs --standard=~/.drush/coder/coder_sniffer/Drupal --extensions='php,module,inc,install,test,profile,theme,js,css,info,txt'"
alias mozjpeg="/opt/mozjpeg/bin/cjpeg"
alias drush5='/usr/local/share/drush5/drush'
alias www='sudo -u www-data'
alias composer8='/usr/bin/php8.0 /usr/local/bin/composer'
alias browserstack='/opt/browserstack/BrowserStackLocal --key NsCCKyzztnTUSFx9pBk5'
alias backdropcheck="grep -rE 'variable_|update_[0-9][0-9][0-9][0-9]|node_save\(|node_delete\(|user_save\(|user_load\(|user_delete\(|file_save\(|file_load\(|file_delete\(|comment_save\(|comment_load\(|comment_delete\(|taxonomy_vocabulary_save\(|taxonomy_vocabulary_load\(|taxonomy_vocabulary_delete\(entity_save\(|entityType|identifier\(|EntityAPIController|entity_property_verbatim_set|defaultLabel\(|files\['"

#shared paths
export PATH="$PATH:$HOME/scripts:$HOME/usr/bin"
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"

if [ -f /usr/bin/nvim ]; then
  alias vim='/usr/bin/nvim'
  alias vimold='/usr/bin/vim'
  alias ovim='/usr/bin/vim'
fi
