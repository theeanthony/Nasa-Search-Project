//
//  SearchViewModel.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//

// This viewmodel will handle fetching for search results and parsing data collected 
import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchResults: [SearchResultModel] = []
    @Published var searchText: String = ""
    @Published var loadingSearch : Bool = false
    
    @Published var totalPageNumbers : Int = 0
    
    @Published var fetchStatus : FetchStatus = .AllGood
    
    var currentPage : Int = 1
    
    //Encodesearchtext will take in a string and remove it's special characters and replace any spaces with %20 to make it
    // a valid urlrequest
    //@param searchText The string being passed by the user to search for something within Nasa's images
    //@return an encoded version of the search text with removed special characters and replaced spaces
    private func encodeSearchText(_ searchText: String) -> String {
        
        //Declare not allowed characters that will mess up search
        let allowedCharacterSet = CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[]").inverted
        guard let encodedText = searchText.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet) else {
            fatalError("Failed to encode search text")
        }
        //Remove blank spaces and replace with acceptable substitute
        return encodedText.replacingOccurrences(of: " ", with: "%20")
    }

    
    //Search uses the searchText to create a URL Request to nasa's api and also takes a response and depending on the request is
    //handled.
    //@param newSearch indicates if its in an initial search or a next page/ previous page type of search. If it is an initial search, newSearch will be true and the currentPage var will be made 1 so that the request of the search can start with the first page. If it is not a newSearch, indicating that the user pressed next page/ previous page the search will be made for the page after or before.
    //@return @published searchResults will either be empty or contain a formatted form of data from the http response.
    func search(newSearch:Bool) {
        // Clear previous search results
        searchResults = []
        self.loadingSearch = true
        if newSearch{
            self.currentPage = 1
        }
        
        // Create the API URL with the search text
        let encodedSearchText = encodeSearchText(searchText)
        let apiUrl = "https://images-api.nasa.gov/search?q=\(encodedSearchText)&media_type=image&page=\(currentPage)"

        // I was receiving errors on bad requests when I added type=image and page=1, this print statement is to check the url
        print(apiUrl)
        // Turns out I was not encoding for spaces and special characters
        
        // Create a URLRequest with the API URL
        guard let url = URL(string: apiUrl) else {
            // Invalid URL
            print("invalid url")
            DispatchQueue.main.async {
                self.fetchStatus = .InvalidURL
            }
            self.loadingSearch = false

            return
        }
        let request = URLRequest(url: url)
        
        // Perform the API request, response will contain data, response, and or error
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            
            if let error = error {
                // Error here indicates network error a request could not be completed
                DispatchQueue.main.async {
                    self.loadingSearch = false
                }
                DispatchQueue.main.async {
                    self.fetchStatus = .NetworkError
                }
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                // Error here indicates response by HTTP is not valid
                DispatchQueue.main.async {
                    self.loadingSearch = false
                }
                DispatchQueue.main.async {
                    self.fetchStatus = .InvalidResponse
                }
                print("Invalid response \(String(describing: error))")
                return
            }
            
            switch httpResponse.statusCode {
            case 200:
                // Successful response
                if let data = data {
                    // Parse the response data
                    if let searchResults = self.parseSearchResults(data: data) {
                        DispatchQueue.main.async {
                            self.searchResults = searchResults
                            if searchResults.isEmpty {
                                self.fetchStatus = .Empty
                            }
                        }
                    } else {
                        // Failed to parse response data, error decoding
                        DispatchQueue.main.async {
                            self.fetchStatus = .FailedDecodeResponseData
                        }
                        DispatchQueue.main.async {
                            self.loadingSearch = false
                        }
                        print("Failed to parse response data")
                    }
                }
            case 400:
                // Bad Request
                
                DispatchQueue.main.async {
                    self.loadingSearch = false
                }
                DispatchQueue.main.async {
                    self.fetchStatus = .BadRequest
                }
                print("Bad Request")
            case 404:
                // Not Found
                DispatchQueue.main.async {
                    self.loadingSearch = false
                }
                DispatchQueue.main.async {
                    self.fetchStatus = .NotFound
                }
                print("Not Found")
            case 500, 502, 503, 504:
                // Server Errors
                DispatchQueue.main.async {
                    self.loadingSearch = false
                }
                DispatchQueue.main.async {
                    self.fetchStatus = .ServerError
                }
                print("Server Error")
            default:
                DispatchQueue.main.async {
                    self.fetchStatus = .UnknownError
                }
                DispatchQueue.main.async {
                    self.loadingSearch = false
                }
                print("Unknown Error")
            }
        }.resume()
    }
    
    //parseSearchResults will take int he data that the http responds with and return either an error or the data formatted in a managable way
    //@param data is the HTTP Response
    //@return either an error or the data formatted to contain Title, Description, Date Created, Image Ref, and Pages of the Collection.
    private func parseSearchResults(data: Data) -> [SearchResultModel]? {
        
        // Set up decoder
        let decoder = JSONDecoder()
        do {
            // Decode data into Search Response
            let response = try decoder.decode(SearchResponse.self, from: data)
            
            // Calculate the total number of pages
            let totalHits = response.collection.metadata.total_hits
            DispatchQueue.main.async {
                let pageNumbers = (totalHits + 99) / 100
                if pageNumbers > 100 {
                    self.totalPageNumbers = 100
                }
                else{
                    self.totalPageNumbers = pageNumbers
                }
            }
            
            // Make sure it's not over 100
      
            
            // Convert response to an array of single items
            let searchResults = response.collection.items.compactMap { item -> SearchResultModel? in
                guard let data = item.data.first else { return nil }
                return SearchResultModel(
                    id: data.nasa_id ?? UUID().uuidString,
                    imageURL: item.links.first?.href ?? "",
                    title: data.title ?? "No Title",
                    description: data.description ?? "No Description Included",
                    date: data.date_created ?? "Missing Date"
                )
            }
            DispatchQueue.main.async {
                self.loadingSearch = false
            }
            DispatchQueue.main.async {
                self.fetchStatus = .AllGood
            }
            return searchResults
        } catch {
            //Catch indicates Error with trying to decode, data could be formatted wrong, or be missing
            DispatchQueue.main.async {
                self.loadingSearch = false
            }
            DispatchQueue.main.async {
                self.fetchStatus = .FailedDecodeResponseData
            }
            print("Failed to decode response data: \(error.localizedDescription)")
            return nil
        }
    }
    // Clear search text, search results, reset currentPage to 1, reset totalPageNumbers to 0, reset fetchStatus to .AllGood
    func clearSearch(){
        self.searchText = ""
        self.searchResults = []
        self.currentPage = 1
        self.totalPageNumbers = 0
        self.fetchStatus = .AllGood

    }
    
    // Searches for the next Page, updates currentPage by 1
    func nextPage(){
        
        if currentPage < totalPageNumbers && currentPage < 100{
            self.currentPage += 1
            search(newSearch: false)
        }else{
            DispatchQueue.main.async {
                self.fetchStatus = .ExceedPageLimit
            }
            return
        }
    }
    // Goes back to the previous Page, updates currentPage by minus 1
    func prevPage(){
        if currentPage > 0 {
            self.currentPage -= 1
            search(newSearch: false)
        }
    }

}
