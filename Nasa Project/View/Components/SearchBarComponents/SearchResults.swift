//
//  SearchResults.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//
// a view of the results that come up when a search is completed contained within a list 
import SwiftUI

struct SearchResults: View {
    
    @State private var results : [SearchResultModel] = [SearchResultModel(imageURL: "", title: "Hello", description: "", date: ""),SearchResultModel(imageURL: "", title: "Hello", description: "", date: ""),SearchResultModel(imageURL: "", title: "Hello", description: "", date: ""),SearchResultModel(imageURL: "", title: "Hello", description: "", date: ""),SearchResultModel(imageURL: "", title: "Hello", description: "", date: "") ]
    var body: some View {
        VStack{
            List(results) { result in
                
                IndividualResult()
                    .listRowBackground(Color.black.opacity(0.6))
                    .listRowSeparatorTint(.white.opacity(0.8))


                


            }
            .listRowSeparator(.hidden)

            .listStyle(.plain)
            .listRowBackground(Color.black)
     
        }
    }
}

struct SearchResults_Previews: PreviewProvider {
    static var previews: some View {
        SearchResults()
    }
}
