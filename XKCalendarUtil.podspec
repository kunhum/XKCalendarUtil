#
# Be sure to run `pod lib lint XKCalendarUtil.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XKCalendarUtil'
  s.version          = '1.0.0'
  s.summary          = '日历工具'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '阴阳历部分基于孙云飞大神写的进行封装'

  s.homepage         = 'https://github.com/kunhum/XKCalendarUtil'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kunhum' => 'kunhum@163.com' }
  s.source           = { :git => 'https://github.com/kunhum/XKCalendarUtil.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'XKCalendarUtil/Classes/XKCalendarUtil/*.{h,m}'
  
  # s.resource_bundles = {
  #   'XKCalendarUtil' => ['XKCalendarUtil/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.subspec 'CoreCalendar' do |coreCalendar|
      coreCalendar.source_files = 'XKCalendarUtil/Classes/XKCalendarUtil/CoreCalendar/*.{h,m}'
      coreCalendar.public_header_files = 'XKCalendarUtil/Classes/XKCalendarUtil/CoreCalendar/*.h'
  end
  
end
