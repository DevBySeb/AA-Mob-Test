# ASSAAbloyTest


`ASSAAbloyTest` is a Swift-based iOS sample project demonstrating the `MVVM` pattern for making API call for search, displaying responses in the UI and saving the selected item in local DB as history.

The project is built using native Swift with a minimum iOS version of iOS 18.2 It leverages async/await for handling network requests efficiently.


### Networking
* Built with native `URLSession` 
* A `generic network layer` that supports all types of REST requests.
* `Mock data support`: Easily inject mock data and use local JSON instead of actual network calls. This is used for unit testing.

### Persistence
* Built with `Realm` 
* A `simple iOS Data Persistence` which is saving selected search result

### Usage
* `Download` the zip 
* `Open the project` in Xcode 16.2.
* `Update SPM` for getting the Realm
* `Run` the project on an iOS 18+ simulator or device.
