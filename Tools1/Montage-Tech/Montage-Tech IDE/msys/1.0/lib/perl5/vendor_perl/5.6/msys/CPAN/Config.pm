
# This is CPAN.pm's systemwide configuration file. This file provides
# defaults for users, and the values can be changed in a per-user
# configuration file. The user-config file is being looked for as
# ~/.cpan/CPAN/MyConfig.pm.

$CPAN::Config = {
  'build_cache' => q[10],
  'build_dir' => q[/c/Users/cwilson/.cpan/build],
  'cache_metadata' => q[1],
  'cpan_home' => q[/c/Users/cwilson/.cpan],
  'ftp' => q[/bin/ftp],
  'ftp_proxy' => q[],
  'getcwd' => q[cwd],
  'gzip' => q[/bin/gzip],
  'http_proxy' => q[],
  'inactivity_timeout' => q[0],
  'index_expire' => q[1],
  'inhibit_startup_message' => q[0],
  'keep_source_where' => q[/c/Users/cwilson/.cpan/sources],
  'lynx' => q[],
  'make' => q[/bin/make],
  'make_arg' => q[],
  'make_install_arg' => q[],
  'makepl_arg' => q[],
  'ncftp' => q[],
  'ncftpget' => q[],
  'no_proxy' => q[],
  'pager' => q[/bin/less],
  'prerequisites_policy' => q[ask],
  'scan_cache' => q[atstart],
  'shell' => q[],
  'tar' => q[/bin/tar],
  'term_is_latin' => q[1],
  'unzip' => q[],
  'urllist' => [q[http://cpan.mirrors.redwire.net/], q[http://mira.sunsite.utk.edu/CPAN/], q[http://www.perl.com/CPAN/]],
  'wait_list' => [q[wait://ls6.informatik.uni-dortmund.de:1404]],
  'wget' => q[/mingw/bin/wget],
};
1;
__END__
