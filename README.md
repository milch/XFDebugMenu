XFDebugMenu
===========

A debug menu for iOS Applications

The goal of this library is to show a debug menu like the one the Flipboard Developers showed at NSConference 2013. It should provide:

* A list of all the variables, methods and properties of the currently presented UIViewController.
* The ability to modify all of the variables with support for all basic types like NSNumber, NSString, etc.
* The ability to run any method (to log additional debug info, for example).
* Traverse the object graph with the current UIViewController as the root.
* Send Mail with a bug report, including screenshots of the whole app and the current view controller.
* Visualize the view hierarchy with the current UIWindow as root (similiar function to Reveal/SparkInspector, but In-App)

The library should be configuration-free, so simply adding it to a project should enable all the features. 
Also, it uses private APIs, so don't include this into an App-Store build! 

Current Status
-------------------
It's all heavily work-in-progress, definitely not ready for anything (yet). The only thing that currently works are the runtime-wrappers. 
