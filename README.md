ioswebapp
=========

Web App - iOS project template


## How to use

1. Copy or fork the project from github and clone it into your computer.
2. Open the project with Xcode and edit de "Bundle ID" from the project configuration. 
3. Change the name of the app in the configuration.
4. Create a new view controller in the Storyboard. Make a segue between this new controller and the Main TabBar controller.
5. Adjust name and icon for this controller.
6. Create a new class. Type its name and in "Subclass of" type **WebTabViewController**.
7. In the Storyboard, select the your last view controller created, then open the "Identity inspector". Below "Custom class" write the name of the class you created.
8. Finally write add this code at the end of the method **viewDidLoad** of your class.

		self.webController.url = @"http://www.apple.com"; 
		
	Change the url to point your web.
	
Following this steps you can add as many view controllers as you need.

## Changing the root view controller

If your app doesn't need a tab bar, you can create any other type of app. Create a new controller of any type and assign it as "Initial Scene", marking the corresponding checkbox in the "Attributes inspector".