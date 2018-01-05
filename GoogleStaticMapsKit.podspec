Pod::Spec.new do |s|
  s.name         = "GoogleStaticMapsKit"
  s.version      = "1.0.0"
  s.summary      = "GoogleStaticMapsKit provide a full swift API for dealing with Google Static Maps API"
  s.description  = <<-DESC
    GoogleStaticMapsKit provide a full swift API for dealing with Google Static Maps API
  DESC
  s.homepage     = "https://github.com/PoissonBallon/GoogleStaticMapsKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Allan Vialatte" => "allan.vialatte@icloud.com" }
  s.social_media_url   = ""
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source       = { :git => "git@github.com:PoissonBallon/GoogleStaticMapsKit.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
