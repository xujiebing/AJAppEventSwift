Pod::Spec.new do |s|
  s.name             = 'AJAppEventSwift'
  s.version          = '0.2.0'
  s.summary          = 'A short description of AJAppEventSwift.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/xujiebing/AJAppEventSwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xujiebing' => 'xujiebing1992@gmail.com' }
  s.source           = { :git => 'https://github.com/xujiebing/AJAppEventSwift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'AJAppEventSwift/Classes/**/*.{swift,h}'
  
end
