
## Getting this project to run

Since we are using a podfile, you **can't open this project as you normally would in XCode.**

Instead, you will need to navigate to the installation directory on your computer,

`
    cd /path/to/project/root
`

and run `pod install` to get the necessary dependencies. This project uses [fakery](https://cocoapods.org/pods/Fakery#address) to generate random data for populating the database.


Open the project by executing the **.xcworkspace** file.

`
    open friendFinder.xcworkspace
`


Because we are using cocoapods (a swift/objC dependency manager), XCode needs to know meta-information not included in the base project directory. Thus, you will receive errors about missing dependencies if you try to open the project as you normally would in XCode.
