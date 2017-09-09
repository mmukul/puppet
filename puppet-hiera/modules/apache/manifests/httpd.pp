
class apache (

  package { 'httpd' :
    ensure => installed,
	}

  file { '/var/www/puppetweb':
      ensure => directory,
      owner  => apache,
      group  => apache,
      mode   => 750,
    }

  file { '/var/www/puppetweb/index.html':
     ensure  => file,
     mode    => '0644',
	 source => 'puppet:///modules/apache/index.html',
	 require => File['/var/www/puppetweb'],
	}
   
  service {'httpd':
    ensure => running,
    enable => true,
	require => Package['httpd'],
  }
  
}

