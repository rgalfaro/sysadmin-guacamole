#Clean the certificates on Puppet Master first then run the following on client:
host=$(hostname)
find /etc/puppetlabs/puppet/ssl/certs -name $host* -delete
puppet agent -t
