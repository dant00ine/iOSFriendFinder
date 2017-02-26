
## Getting this project to run

Since we are using a podfile, you **can't open this project as you normally would in XCode.**

Instead, you will need to navigate to the installation directory on your computer,

`
    cd /path/to/project/root
`

and run `pod install` to get the necessary dependencies. This project uses [fakery](https://cocoapods.org/pods/Fakery#address) to generate random data for populating the database.

`
    pod install
`


Open the project by executing the **.xcworkspace** file.

**NOTE: this project will not run if you open it from XCode's 'open' command; instead you must run the .xcworkspace file**
`
    open friendFinder.xcworkspace
`
Because we are using a podfile to manage our cocoapods (swift/objC dependency manager), and XCode needs to know meta-information not included in the base project directory, you will receive errors about missing dependencies if you try to open the project as you normally would in XCode.
