#!/usr/bin/ruby1.9.1
require 'winrm'
endpoint = "http://#{ARGV[0]}:5985/wsman"
krb5_realm = File.open("realm.conf").read
winrm = WinRM::WinRMWebService.new(endpoint, :kerberos, :realm => krb5_realm)
#winrm = WinRM::WinRMWebService.new(endpoint, :ssl, :user => 'myuser', :pass => 'asdf', :disable_sspi => true)
#winrm = WinRM::WinRMWebService.new(endpoint, :plaintext, :user => 'myuser', :pass => 'asdf', :disable_sspi => true)
winrm.cmd("#{ARGV[1]}") do |stdout, stderr|
  STDOUT.print stdout
  STDERR.print stderr
end
