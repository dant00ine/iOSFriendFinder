## How to Use Friend Finder

Get started by cloning this repository from your command line.

`
git clone https://github.com/dant00ine/iOSFriendFinder

`
## Getting the project to run

Since we are using a podfile, you **can't just open this project normally in XCode.**

Instead, you will need to navigate to the installation directory on your computer.

`
    cd /path/to/project/root
`

Next, run `pod install` to get the necessary dependencies. This project uses [fakery](https://cocoapods.org/pods/Fakery#address) to generate random data for populating the database.


Now, you can start the file by opening the directory `open .` and executing **the .xcworkspace** file.

**NOTE: this project will not run if you just open it from Xcode, you must run the .xcworkspace file instead**
This is because we are using a podfile, and XCode needs to know meta-information about the project that is not included in the base project directory that is linked to the XCode open command.
