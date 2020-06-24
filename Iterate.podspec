Pod::Spec.new do |spec|
  spec.name           = "Iterate"
  spec.version        = "0.1.0"
  spec.summary        = "In-app user research made easy."
  spec.description    = <<-DESC
                        Iterate surveys put you directly in touch with your app users to 
                        learn how you can change for the better.
                        DESC
  spec.homepage       = "https://iteratehq.com"
  spec.screenshots    = "https://github.com/iteratehq/iterate-ios/raw/master/Assets/static-banner.png?raw=true"
  spec.license        = { :type => "MIT" }
  spec.author         = { "Mike Singleton" => "mike@iteratehq.com" }

  spec.platform       = :ios, "12.0"
  spec.source         = { :git => "https://github.com/iteratehq/iterate-ios.git", :tag => "v#{spec.version}" }
  spec.source_files   = "Iterate/**/*.{h,m,swift}"
  spec.resource_bundles = {
    'Iterate' => ["Iterate/**/*.{storyboard,xib,xcassets,json,imageset,png}"]
  }
  spec.swift_versions = ['4.2', '5.0']
  spec.framework      = "Webkit"
end
