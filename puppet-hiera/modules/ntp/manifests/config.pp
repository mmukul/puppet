# lookup ntpservers from hiera

class ntp::config($ntpservers = hiera('ntpservers')) {
  file{'/etc/ntp.conf':
    ensure  => file,
    content => template('ntp/ntp.conf.erb')
  }
}
