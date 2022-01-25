class profile::psscript {
  # exec { 'rename-guest':
  #   command   => file('puppet:///site-modules/profile/files/test.ps1'),
  #   provider  => powershell,
  #   logoutput => true,
  # }
  # https://community.chocolatey.org/install.ps1

  exec { 'download chocolatey':
    command => 'mkdir "C:/temp";Invoke-WebRequest "https://community.chocolatey.org/install.ps1" -OutFile "C:/temp/install.ps1"',
    provider => powershell,
    creates => 'C:/temp/install.ps1'
  }
  exec { 'rename-guest':
    command   => 'powershell -NoProfile -ExecutionPolicy Bypass -Command C:/temp/install.ps1',
    provider  => powershell,
    logoutput => true,
  }
}
