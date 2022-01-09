#
# Be sure to run `pod lib lint DLProgressHUD.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

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
  
end
