Pod::Spec.new do |s|
  s.name             = 'DLProgressHUD'
  s.version          = '0.1.0'
  s.summary          = 'Lightweight Progress HUD implementation for iOS.'

  s.description      = <<-DESC
Lightweight and highly configurable Progress HUD implementation for iOS.
                       DESC

  s.homepage         = 'https://github.com/DeluxeAlonso/DLProgressHUD'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DeluxeAlonso' => 'alonso.alvarez.dev@gmail.com' }
  s.source           = { :git => 'https://github.com/DeluxeAlonso/DLProgressHUD.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'

  s.source_files = 'DLProgressHUD/Classes/**/*.swift'
  s.swift_versions = ['5.0']
end