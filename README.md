# Nasa-Search-Project

**How to run Nasa Project App** 

- Download zip NasaProject
- Open zip file
- Double click or right click and press open on Nasa Project.xcodeproj
- Command + r to build and run on your simulator in xcode or chosen device connected to laptop
- Tap on search bar and input a search term to look up photos and information from Nasa Site

  ** Libraries / Frameworks  **
  - Foundation: It is a fundamental framework that provides essential building blocks for developing iOS applications. It includes classes, protocols, and data types for working with strings, collections, networking, file management, dates and times, and more.
  - SwiftUI: It is a user interface toolkit and framework for building user interfaces in iOS applications. SwiftUI allows you to create user interfaces declaratively using Swift code and provides a wide range of views, controls, and layout options for building modern and responsive user interfaces.
 
  ** Architecture Overview **
  1. User Interface Layer
     - Views : Contains the user interface components responsible for displaying the app's screens and interacting with the user.
     - View Models: Acts as an intermediary between the views and the underlying data. Handles user interactions, manages app state, and updates the views accordingly. More specifically, SearchViewModel handles user interactions of searching, looking at the next or previous pages, retrieving search results, and notifying user if there has been an error like a network error or empty retrieval.
  2. Business Logic Layer
     - Search Bar : Orchestrates the search functionality, coordinates interactions between the network client and data models, and provides search-related operations.
  3. Data Layer
     - SearchResponse Model: Represent the structure and format of the data retrieved from NASA's API.
     - SearchResponseModel Model: Represent the structure and format of the data retrieved from NASA's API but in a format more manageable for me.
     - AsyncImage : Retrieves, Stores and caches image
       
  4. The flow of the app would typically start with the user interacting with the views, triggering a search request. The view models handle the user input and communicate with the search bar. The search var interacts with the network client to make requests to NASA's API and retrieves the search results. The results are then directly propagated back to the view models, which update the views accordingly.
