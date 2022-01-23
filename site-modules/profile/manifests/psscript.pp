class profile::psscript {
  exec { 'rename-guest':
    command   => file('./test.ps1'),
    provider  => powershell,
    logoutput => true,
  }
}
