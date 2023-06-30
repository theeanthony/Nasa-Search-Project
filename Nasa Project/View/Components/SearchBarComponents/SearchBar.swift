//
//  SearchBar.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//
//Customize the search bar to make it look pretty.

import SwiftUI

struct SearchBar: View {
    
    @Binding var hideMainNasaImage : Bool
    @FocusState var isFocused : Bool
    @ObservedObject var searchViewModel : SearchViewModel
    var body: some View {
        HStack {
            
            if isFocused || hideMainNasaImage{
                Image("nasa")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:30)
                    .padding(.leading, 10)

            }
            TextField("Search", text: $searchViewModel.searchText)
                .ignoresSafeArea(.keyboard)
                .foregroundColor(.white)
                .onSubmit {
                    searchViewModel.search(newSearch: true)
                }
                .focused($isFocused)
                .onChange(of: isFocused, perform: { _ in
                    self.hideMainNasaImage = true
                })
                .placeholder(when:searchViewModel.searchText.isEmpty) {
                    Text("Try Search for \"Apollo\"").opacity(0.75).foregroundColor(.white)

            }
                .padding()
//                .
            
            Spacer()
            
            if hideMainNasaImage {
                Button {
                    self.hideMainNasaImage = false
                    self.isFocused = false
                    searchViewModel.clearSearch()
                } label: {
                    Text("Cancel").foregroundColor(.white).opacity(0.8)
                        .padding(.trailing,15)
                }
            }

           
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
