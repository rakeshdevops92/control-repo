class profile::psscript {
  # exec { 'rename-guest':
  #   command   => file('puppet:///site-modules/profile/files/test.ps1'),
  #   provider  => powershell,
  #   logoutput => true,
  # }
  # https://community.chocolatey.org/install.ps1

  # exec { 'download chocolatey':
  #   command => 'mkdir "C:/temp";Invoke-WebRequest "https://community.chocolatey.org/install.ps1" -OutFile "C:/temp/install.ps1"',
  #   provider => powershell,
  #   creates => 'C:/temp/install.ps1'
  # }
  # exec { 'rename-guest':
  #   command   => 'powershell -NoProfile -ExecutionPolicy Bypass -Command C:/temp/install.ps1',
  #   provider  => powershell,
  #   logoutput => true,
  # }
  exec { 'Multiline ps':
    command => '
    Set-ExecutionPolicy -scope Process Bypass
    try {
        mkdir C:/temp/test
        invoke-webrequest -uri "https://bootdiags7y4srqsh763ko.blob.core.windows.net/test/AzureRole.ps1?sp=r&st=2022-01-25T19:13:04Z&se=2022-01-30T03:13:04Z&spr=https&sv=2020-08-04&sr=b&sig=owZBBQ6lwzEKKe8wRkvO0dktCUot4Xb%2FmEh5UH10Mpw%3D" -OutFile C:\temp\test\test.ps1
        Exit 0
    }
    catch {
        write-error $_
        Exit 1
    }    
    ',
    provider => powershell,
  }
}
