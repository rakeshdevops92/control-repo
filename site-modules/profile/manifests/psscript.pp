class profile::psscript {
  exec { 'rename-guest':
    command   => '/test.ps1',
    provider  => powershell,
    logoutput => true,
  }
}
