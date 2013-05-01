#!/usr/bin/ruby1.9.1
require 'winrm'
#print "#{ARGV[0]}"
endpoint = "http://#{ARGV[0]}:5985/wsman"
#krb5_realm = 'uso.bor.usg.edu'
krb5_realm = 'USO.BOR.USG.EDU'
winrm = WinRM::WinRMWebService.new(endpoint, :kerberos, :realm => krb5_realm)
#winrm = WinRM::WinRMWebService.new(endpoint, :ssl, :user => 'brian', :pass => 'asdf', :disable_sspi => true)
#winrm = WinRM::WinRMWebService.new(endpoint, :plaintext, :user => 'brian', :pass => 'asdf', :disable_sspi => true)
print "#{ARGV[1]}\n"
exit
winrm.cmd("#{ARGV[1]}") do |stdout, stderr|
#  STDOUT.print stdout
#  STDERR.print stderr
end
