#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint native_video_player.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'abs_native_video_player'
  s.version          = '0.0.4'
  s.summary          = 'A Flutter widget to play videos on iOS and Android using a native implementation.'
  s.description      = <<-DESC
A Flutter widget to play videos on iOS and Android using a native implementation.
                       DESC
  s.homepage         = 'https://pub.dev/packages/abs_native_video_player'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Gabriel Gideon' => 'gideongabriel557@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.platform = :ios, '9.0'
  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
