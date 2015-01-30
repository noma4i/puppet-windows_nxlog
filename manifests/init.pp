define windows_nxlog (
  $ensure   = 'enabled',
  $host = "127.0.0.1",
  $port = "514"
){
  case $ensure {
    'enabled', 'present': {
      exec { 'cmd /c net stop nxlog || exit /b 0':
        path => $::path,
        logoutput => false
      }->
      download_file { "Download NXLog" :
        url                   => 'http://nxlog.org/system/files/products/files/1/nxlog-ce-2.8.1248.msi',
        destination_directory => 'c:\temp',
        destination_file      => 'nxlog.msi'
      }->
      exec { "Install ${kb}":
        command  => template('windows_nxlog/install_nxlog.ps1.erb'),
        creates  => 'C:\\Program Files (x86)\\nxlog\\nxlog.exe',
        provider => 'powershell',
        timeout  => 1800
      }->
      file { 'C:\\Program Files (x86)\\nxlog\\conf\\nxlog.conf':
        ensure             => file,
        source_permissions => ignore,
        content             => template('windows_nxlog/nxlog.conf.erb')
      }->
      exec { 'cmd /c net start nxlog  || exit /b 0':
        path => $::path,
        logoutput => false
      }
    }
    default: {
      fail('Invalid ensure option!\n')
    }
  }
}