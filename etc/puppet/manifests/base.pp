class net::dahearditrecords::www {
  exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
  }
  Exec["apt-get update"] -> Package <| |>

  exec { 'a2enmod rewrite':
    command => '/usr/sbin/a2enmod rewrite',
    require => Package['apache2'],
    notify => Service['apache2']
  }

  exec { 'mysql load dump': 
    command => '/usr/bin/mysql -uroot < /vagrant/src/data/fixtures/dump.sql',
    require => Package['mysql-server']
  }

  package { ["apache2", "libapache2-mod-php5", "php5-cli", "php5-mysqlnd", "php-apc", "vim-tiny", "mysql-server"]:
    ensure => present,
  }

  service { "apache2":
    ensure => running,
    require => Package["apache2"],
    subscribe => File['/etc/apache2/envvars']
  }

  service { ["mysql"]:
    ensure => running,
    require => Package["mysql-server"],
  }

  file { '/etc/apache2/sites-available/default':
    ensure => present,
    source => "puppet:///vagrant_puppet_files/etc/apache2/sites-available/default",
    notify => Service['apache2'],
    require => Package["apache2"],
  }

  file { '/etc/apache2/envvars':
    ensure => present,
    source => "puppet:///vagrant_puppet_files/etc/apache2/envvars",
    require => Package["apache2"],
  }
}

include net::dahearditrecords::www