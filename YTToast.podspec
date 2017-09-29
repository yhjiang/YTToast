#
# Be sure to run `pod lib lint YTToast.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YTToast'
  s.version          = '0.1.0'
  s.summary          = 'an Objective-C Toast Project Package based on CRToast'

  s.description      = 'an Objective-C Toast Project Package based on CRToast.'
  s.homepage         = 'https://github.com/yhjiang/YTToast'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yhjiang' => 'iyhjiang@gmail.com' }
  s.source           = { :git => 'https://github.com/yhjiang/YTToast.git', :tag => s.version }

  s.ios.deployment_target = '7.0'

  s.source_files = 'YTToast/Classes/**/*'
  s.resource     = 'YTToast/YTToastSource.bundle'
  s.frameworks = 'UIKit', 'Foundation'
  s.dependency 'CRToast', '~> 0.0.9'

end
