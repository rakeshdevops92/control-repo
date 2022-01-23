class profile::psscript {
  exec { 'rename-guest':
    command   => file('/etc/puppetlabs/code/environments/staging/site-modules/profile/files/test.ps1'),
    provider  => powershell,
    logoutput => true,
  }
}
