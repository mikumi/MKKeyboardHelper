#
# Be sure to run `pod lib lint MKKeyboardHelper.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MKKeyboardHelper'
  s.version          = '0.2.0'
  s.summary          = 'Better handling of TextFields together with the keyboard.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    Moves the screen up so that the keyboard doesn't cover the UITextField. Also tapping outside the textfield dismisses the keyboard.
                       DESC

  s.homepage         = 'https://github.com/mikumi/MKKeyboardHelper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Michael Kuck' => 'me@michael-kuck.com' }
  s.source           = { :git => 'https://github.com/mikumi/MKKeyboardHelper.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/@michaelkuckcom'

  s.ios.deployment_target = '8.0'

  s.source_files = 'MKKeyboardHelper/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MKKeyboardHelper' => ['MKKeyboardHelper/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
