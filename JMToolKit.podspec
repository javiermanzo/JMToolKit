#
# Be sure to run `pod lib lint JMToolKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JMToolKit'
  s.version          = '0.1.2'
  s.summary          = 'Group of helpers.'


  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/javiermanzo/JMToolKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Javier Manzo' => 'javier.r.manzo@gmail.com' }
  s.source           = { :git => 'https://github.com/javiermanzo/JMToolKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/javitramp'

  s.source_files = ['JMToolKit/Classes/**/*.{h,m,swift}']

  s.ios.deployment_target = '11.0'
  s.swift_version = '4.2'

end
