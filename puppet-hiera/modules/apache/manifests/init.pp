
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
     content => "Index HTML Is Managed By Puppet",
     mode    => '0644',
	 require => File['/var/www/puppetweb'],
	}
  
    #content => template('apache/apache.conf.erb')
   
  service {'httpd':
    ensure => running,
    enable => true,
	require => Package['httpd'],
  }
  
}

