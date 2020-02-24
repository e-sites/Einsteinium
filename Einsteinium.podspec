Pod::Spec.new do |s|

  s.name         = "Einsteinium"
  s.version      = "1.2.3"
  s.author       = { "Bas van Kuijck" => "bas@e-sites.nl" }
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.homepage     = "http://www.e-sites.nl"
  s.summary      = "A collection of swift extensions"
  s.source       = { :git => "https://github.com/e-sites/Einsteinium.git", :tag => "v#{s.version}" }
  s.source_files = "Sources/**/*.{h,swift}"
  s.platform     = :ios, '9.0'
  s.requires_arc = true
end
