# Manage NTP
class ntp_module {
  ensure_packages(['ntp'])
  
  file { '/etc/ntp.conf':
    source  =>  'puppet:///modules/ntp_module/ntp.conf',
    notify  =>  Service['ntp'],
    require =>  Package['ntp'],
  }

  Service { 'ntp':
    ensure  =>  running,
    enable  =>  true,
  }
}
