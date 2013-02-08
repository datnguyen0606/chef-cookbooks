# Required dependencies
set[:gitlab][:dependencies] = %w{
  libcurl4-openssl-dev
  libffi-dev
  libgdbm-dev
  libicu-dev
  libncurses5-dev
  libreadline-dev
  libssl-dev
  libxml2-dev
  libxslt-dev
  libyaml-dev
  redis-server
  ruby1.9.3
  zlib1g-dev
}

set[:gitlab][:dbName] = "gitlab_production"
set[:gitlab][:dbUsername] = "gitlab"
#set[:gitlab][:dbPassword] = "gitlab"

# Users info
default[:gitlab][:git_user][:name] = "git"
default[:gitlab][:git_user][:shell] = "/bin/bash"
default[:gitlab][:git_user][:home] = "/home/git"

default[:gitlab][:gitlab_user][:name] = "gitlab"
default[:gitlab][:gitlab_user][:shell] = "/bin/bash"
default[:gitlab][:gitlab_user][:home] = "/home/gitlab"

default[:gitlab][:group] = "git"
default[:gitlab][:dir] = "/home/gitlab/gitlab"
