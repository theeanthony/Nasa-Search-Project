//
//  SearchBar.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//
//Customize the search bar to make it look pretty.

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText : String
    @FocusState var tapped : Bool
    var body: some View {
        HStack {
            
            if tapped{
                Image("nasa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:30)
                    .padding(.leading, 10)

            }
            TextField("Search", text: $searchText)
                .focused($tapped)
                .padding()
                .accentColor(.white)
                .foregroundColor(tapped ? .white : .white.opacity(0.6))
           
        }
        .background(Rectangle().stroke(.white, lineWidth: 2))
        .padding(.horizontal, 15)

        .padding(.vertical, 8)
    }
}

//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar()
//    }
//}
