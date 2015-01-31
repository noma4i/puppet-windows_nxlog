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

#### NXLog config explained 

##### Section `events`
    Events are consumed using `im_msvistalog` module which is working only in win7 and later.
    Pointer starts to read Windows Event log from last record.

##### Section `transform_events`
    All input events are transformed to `syslog` type.

