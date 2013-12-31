require 'spec_helper'

describe 'yum_test::test' do
  let(:chef_run) do
    ChefSpec::Runner.new(
      :step_into => %w{ yum_repository yum_globalconfig }
      ).converge(described_recipe)
  end

  let(:test1_content) do
    '# This file was generated by Chef for chefspec.local
# Do NOT modify this file by hand.

[test1]
name=an test
baseurl=http://drop.the.baseurl.biz
enabled=1
gpgcheck=1
sslverify=1
'
  end

  let(:test2_content) do
    '# This file was generated by Chef for chefspec.local
# Do NOT modify this file by hand.

[unit-test-2]
name=test all the things!
baseurl=http://example.com/wat
cost=10
enabled=1
enablegroups=1
exclude=package1 package2 package3
failovermethod=priority
fastestmirror_enabled=true
gpgcheck=1
gpgkey=http://example.com/RPM-GPG-KEY-FOOBAR-1
http_caching=all
include=/some/other.repo
includepkgs=package4 package5
keepalive=1
metadata_expire=never
mirrorlist=http://hellothereiammirrorliststring.biz
mirror_expire=300
mirrorlist_expire=86400
priority=10
proxy=http://hellothereiamproxystring.biz
proxy_username=kermit
proxy_password=dafrog
retries=10
sslcacert=/path/to/directory
sslclientcert=/path/to/client/cert
sslclientkey=/path/to/client/key
sslverify=1
timeout=10
'
  end

  let(:test5_content) do
    '# This file was generated by Chef for chefspec.local
# Do NOT modify this file by hand.

[test5]
name=an test
baseurl=http://drop.the.baseurl.biz
enabled=1
gpgcheck=1
sslverify=1
'
  end

  let(:test6_content) do
    '# This file was generated by Chef for chefspec.local
# Do NOT modify this file by hand.

[test6]
name=an test
baseurl=http://drop.the.baseurl.biz
enabled=1
gpgcheck=1
gpgkey=http://example.com/RPM-GPG-KEY-FOOBAR-1
sslverify=1
'
  end

  let(:test7_content) do
    '# This file was generated by Chef for chefspec.local
# Do NOT modify this file by hand.

[main]
cachedir=/var/cache/yum/$basearch/$releasever
debuglevel=2
exactarch=1
gpgcheck=1
installonly_limit=3
keepcache=0
logfile=/var/log/yum.log
obsoletes=1
plugins=1'
  end

  let(:test8_content) do
    '# This file was generated by Chef for chefspec.local
# Do NOT modify this file by hand.

[main]
alwaysprompt=true
assumeyes=true
bandwidth=40
bugtracker_url=http://somewhere.eltz.biz
cachedir=/path/to/somewhere/good
clean_requirements_on_remove=true
color=always
color_list_available_downgrade=fg:green
color_list_available_install=fg:green
color_list_available_reinstall=fg:green
color_list_available_upgrade=fg:green
color_list_installed_extra=fg:green
color_list_installed_newer=fg:green
color_list_installed_older=fg:green
color_list_installed_reinstall=fg:green
color_search_match=bold
color_update_installed=fg:blue
color_update_local=fg:blue
color_update_remote=fg:blue
commands=--installroot=root=/over/there
debuglevel=5
diskspacecheck=true
distroverpkg=fedora-release
enable_group_conditionals=1
errorlevel=5
exactarch=1
exclude=kernel emacs-nox
gpgcheck=1
group_package_types=default mandatory
history_list_view=commands
history_record=true
history_record_packages=rpm
http_caching=true
installonly_limit=3
installonlypkgs=kernel, emacs-nox
installroot=/over/there
keepalive=true
keepcache=1
kernelpkgnames=dowhatnow
localpkg_gpgcheck=true
logfile=/your/logs/here
max_retries=10
mdpolicy=instant
metadata_expire=21600
mirrorlist_expire=21600
multilib_policy=best
obsoletes=1
overwrite_groups=true
password=ohai
persistdir=/somewhere/good
pluginconfpath=/etc/yum/pluginconf.d
pluginpath=/path/to /some/plugins
plugins=1
protected_multilib=true
protected_packages=yum glob:/etc/yum/protected.d/*.conf
proxy=https://datproxy.biz
proxy_password=evewashere
proxy_username=alice
recent=7
repo_gpgcheck=true
reset_nice=true
rpmverbosity=warn
showdupesfromrepos=true
ssl_check_cert_permissions=true
sslcacert=/path/to/cacert
sslclientcert=/path/to/clientcert
sslclientkey=/path/to/clientkey
sslverify=true
syslog_device=/dev/log
syslog_facility=LOG_USER
syslog_ident=chuck norris
throttle=100000M
timeout=30
tsflags=noscripts
username=baub'
  end

  context 'creating a yum_repository with minimal parameters' do
    it 'creates yum_repository[test1]' do
      expect(chef_run).to create_yum_repository('test1')
    end

    it 'steps into yum_repository and creates template[/etc/yum.repos.d/test1.repo]' do
      expect(chef_run).to render_file('/etc/yum.repos.d/test1.repo').with_content(test1_content)
    end
  end

  context 'creating a yum_repository with full parameters' do
    it 'creates yum_repository[test2]' do
      expect(chef_run).to create_yum_repository('test2')
    end

    it 'steps into yum_repository and creates template[/etc/yum.repos.d/unit-test-2.repo]' do
      expect(chef_run).to render_file('/etc/yum.repos.d/unit-test-2.repo').with_content(test2_content)
    end
  end

  context 'creating a yum_repository with the :remove action alias' do
    it 'adds yum_repository[test3]' do
      expect(chef_run).to add_yum_repository('test3')
    end
  end

  context 'creating a yum_repository with the :add action alias' do
    it 'adds yum_repository[test4]' do
      expect(chef_run).to remove_yum_repository('test4')
    end
  end

  context 'creating a yum_repository with the :url parameter alias' do
    it 'creates yum_repository[test5]' do
      expect(chef_run).to create_yum_repository('test5')
    end

    it 'steps into yum_repository and creates template[/etc/yum.repos.d/test5.repo]' do
      expect(chef_run).to render_file('/etc/yum.repos.d/test5.repo').with_content(test5_content)
    end
  end

  context 'creating a yum_repository with the :keyurl parameter alias' do
    it 'creates yum_repository[test6]' do
      expect(chef_run).to create_yum_repository('test6')
    end

    it 'steps into yum_repository and creates template[/etc/yum.repos.d/test6.repo]' do
      expect(chef_run).to render_file('/etc/yum.repos.d/test6.repo').with_content(test6_content)
    end
  end

  context 'creating a yum_globalconfig with minimal parameters' do
    it 'creates yum_globalconfig[/etc/yum.conf]' do
      expect(chef_run).to create_yum_globalconfig('/tmp/yum.conf')
    end

    it 'steps into yum_globalconfig and creates template[/etc/yum.conf]' do
      expect(chef_run).to render_file('/tmp/yum.conf').with_content(test7_content)
    end
  end

  context 'creating a yum_globalconfig with full parameters' do
    it 'creates yum_globalconfig[/tmp/yum-full.conf]' do
      expect(chef_run).to create_yum_globalconfig('/tmp/yum-full.conf')
    end

    it 'steps into yum_globalconfig and creates template[/tmp/yum-full.conf]' do
      expect(chef_run).to render_file('/tmp/yum-full.conf').with_content(test8_content)
    end
  end

end
