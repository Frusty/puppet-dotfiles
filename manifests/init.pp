class dotfiles {
  include boxen::config
  include homebrew

  $home     = "/Users/${::luser}"
  $dotfiles = "${home}/.dotfiles"

  repository { $dotfiles:
    source  => 'frusty/dotfiles',
  }

  exec { "install":
    cwd => $dotfiles,
    command => "rake install",
    require => Repository[$dotfiles]
  }
}