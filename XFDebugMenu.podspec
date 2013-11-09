Pod::Spec.new do |s|
  s.name         = "XFDebugMenu"
  s.version      = "0.1a"
  s.summary      = "Shows a debug menu like the one the Flipboard devs showed at NSConf 2013"

  s.description  = <<-DESC
		   The goal of this library is to show a debug menu like the one the Flipboard Developers showed at NSConference 2013. It should provide:

		   * A list of all the variables, methods and properties of the currently presented UIViewController.
		   * The ability to modify all of the variables with support for all basic types like NSNumber, NSString, etc.
		   * The ability to run any method (to log additional debug info, for example).
		   * Traverse the object graph with the current UIViewController as the root.
		   * Send Mail with a bug report, including screenshots of the whole app and the current view controller.
		   * Visualize the view hierarchy with the current UIWindow as root (similiar function to Reveal/SparkInspector, but In-App)

		   The library should be configuration-free, so simply adding it to a project should enable all the features. 
		   Also, it uses private APIs, so don't include this into an App-Store build! 

                   DESC

  s.homepage     = "www.github.com/milch/XFDebugMenu.git"
  # s.screenshots  = "www.example.com/screenshots_1", "www.example.com/screenshots_2"

  s.license      = 'MIT'
  s.author       = { "Manu Wallner" => "m.wallner@xforge.at" }



   s.platform     = :ios


  s.source       = { :git => "http://github.com/milch/XFDebugMenu.git", :tag => "0.1a" }


  s.source_files  = 'Classes', 'Classes/**/*.{h,m}'
  s.exclude_files = 'Classes/Exclude'


  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"

  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'


   s.requires_arc = true

  # s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
  # s.dependency 'JSONKit', '~> 1.4'
end
