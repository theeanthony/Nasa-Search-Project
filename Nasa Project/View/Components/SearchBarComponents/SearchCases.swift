//
//  SearchCases.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//
// This view handles the displayment of all possible errors that might arise when searching. 

import SwiftUI

struct SearchCases: View {
    @ObservedObject var searchViewModel : SearchViewModel
    var body: some View {
        VStack{
            switch searchViewModel.fetchStatus {
           
            case .AllGood:
                EmptyView()
            case .Empty:
                Image("stars")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:100)
                    .padding(.top,20)
                Text("No results match your search. Try again.").font(.largeTitle).foregroundColor(.white)
                    .padding(.top,10)

             default:
                Image("meteor")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:100)
                    .padding(.top,20)

                Text("There has been an error, \(searchViewModel.fetchStatus.showAlert())").font(.largeTitle).foregroundColor(.white)
                    .padding(.top,10)

            }
        }
    }
}

//struct SearchCases_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchCases()
//    }
//}
