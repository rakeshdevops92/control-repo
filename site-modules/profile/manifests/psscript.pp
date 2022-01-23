class profile::psscript {
  exec { 'rename-guest':
    command   => file('puppet:///site-modules/profile/files/test.ps1'),
    provider  => powershell,
    logoutput => true,
  }
}
