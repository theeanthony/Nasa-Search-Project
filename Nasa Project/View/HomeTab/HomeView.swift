//
//  HomeView.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//
// The first page of the search app. Contains the search bar, the nasa logo and some filters. Prioritizes the search
//functionality of the application
import SwiftUI

struct HomeView: View {
    @State private var searchText : String = ""
    
    @State private var cancelPressed : Bool = false
    
    var body: some View {
        VStack{
            Spacer()
            
            Image("nasa")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:200)
            
            SearchBar(searchText: $searchText)
                .padding(.vertical,15)
            SearchResults()
            
            Spacer()
        }
        .background(BackgroundView())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
