#
# Be sure to run `pod lib lint DevicePpi.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DevicePpi'
  s.version          = '1.2.5'
  s.summary          = 'Gets the PPI resolution of the display'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Gets the PPI resolution of the display, using a built-in list of known devices.
                       DESC

  s.homepage         = 'https://github.com/Clafou/DevicePpi'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Seb Molines' => 'clafou@gmail.com' }
  s.source           = { :git => 'https://github.com/Clafou/DevicePpi.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/Clafou'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DevicePpi/**/*.swift'
  s.swift_version = '5.0'
  
  s.frameworks = 'UIKit'
end
