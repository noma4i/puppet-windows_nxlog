# windows_nxlog

Puppet module to install and setup Fluentd client(nxlog) to Windows machine.

#### How to use

````puppet
    windows_nxlog {'Setup NXLog to send logs to Fluentd':
      ensure => 'present',
      host => '192.168.33.10',
      port => '514'
    }
````

This is a basic setup which will download, install and configure NXLog for sending logs to Fluentd.

If you want to changes that, you are free to edit `templates\nxlog.conf.erb`