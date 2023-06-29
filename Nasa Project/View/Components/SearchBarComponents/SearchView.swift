//
//  SearchView.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//
//contains the search bar and search results views, this will display the search results and the search bar together 

import SwiftUI

struct SearchView: View {
    @Binding var hideMainNasaImage : Bool
    
    @StateObject private var searchViewModel : SearchViewModel = SearchViewModel()
    
    var body: some View {
        VStack{
            SearchBar(hideMainNasaImage: $hideMainNasaImage, searchViewModel: searchViewModel)
            SearchResults(searchViewModel: searchViewModel,logoShowing: $hideMainNasaImage)
            Spacer()
        }
    }
}

//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
