
## Assignment

Clone the assignment branch of this repository to challenge your knowledge of NSPredicates and fetch requests.

In the first scene (friendTimeController), see if you can implement the findPeopleCount and findRandomPersonToLogin functions.

In the last scene (FriendTableViewController), see if you can implement the missing predicates and filters to fetch the correct friends for displaying. Read the comments if you're unclear on where to find them.



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

Once you've opened the project this way once, you will be able to open it as you would normally.

Because we are using cocoapods (a swift/objC dependency manager), XCode needs to know meta-information not included in the base project directory. Thus, you will receive errors about missing dependencies if you try to open the project as you normally would in XCode.

*Note* the app could probably be better organized from an MVC perspective so don't take too many tips from that...

