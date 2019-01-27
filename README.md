#  TMDB Coding Challenge, readme:

### This project aims to create an iOS Native App based on the TMDB API, this API provides endpoints for:

- Upcoming movies
- Movie search
- Movie details

### Project minimum requirements:

- Xcode 10.0.1 +
- MacOS Mojave 10.14 +
- iOS 12 +
- Swift 4.2 +

### Project Dependencies:

This project runs using 3rd party code libraries managed by Cocoapods, to install
it you must:

- sudo gem install Cocoapods

in the root folder of the project:

- pod install

Installed Pods:

- PureLayout, library to manage AutoLayout via code in a simpler and easier to maintain way
- moa, async image downloader manager for UIImageViews

### Project Structure:

+ XCWorkspace
    + CodeChallenge XCProject
        + CodeChallenge
            - Extensions
            + Cells
            + Controllers
            + Utils
            + Models
        - Assets.xcassets
        - LaunchScreen.Storyboard
        - Info.plist

    + Pods XCProject
    ...

### Structures / Architectures / Coding Style

- API calls functions are located on Service.swift file, this file contains
all the calls to services with completion blocks for async handling of services responses.
The JSON parsing is managed using Swift 4 Decodable protocol that allows such functionality
without 3rd party libraries

- Each ViewController is self build without using the Storyboard
- Most of the ViewControllers follows this coding pattern:
    - Local variables and objects (Such as UIKit elements) declaration
    - CreateView method for local variables and Objects
    - SetupConstraints method, handles the AutoLayout constraints for local elements
    - 1:1 KVO   by implementing structs and didSet methods to react and pass data 
    - Most of the UI is done via code by composing UITableViewControllers with Custom Headers with separate files
- Colors class, is a class with all the colors references for the entire project
- Const file, is a file with all the const variables such as the base url for the API calls

### Functionality

The project runs one tabBar controller containing 2 ViewControllers, one for the homeView (Upcoming movies) that allows the infinite scroll feature and quick search for movies in the screen. 

The second controllers uses the search API service that allows you to search any movie by its name

