version = "10.0.3";

Pod::Spec.new do |s|
  s.name                = "DotzuXRG"
  s.summary             = "DotzuXRG"
  s.description         = <<-DESC
                              iOS Debugging Tool
                             DESC
  s.homepage            = "https://github.com/stackhou/DotzuX"
  s.author              = { "hm" => "houmanager@hotmail.com" }
  s.license             = "MIT"
  s.source_files        = "Sources", "Sources/**/*.{h,m,swift}"
  s.public_header_files = "Sources/**/*.h"
  s.resources           = "Sources/**/*.{png,xib,storyboard}"
  s.frameworks          = 'UIKit', 'Foundation'
  s.requires_arc        = true
  s.swift_version       = '4.0'
  s.platform            = :ios, "8.0"
  s.source              = { :git => "https://github.com/stackhou/DotzuX.git", :branch => 'master', :tag => "#{version}" }
  s.version             = version
end
