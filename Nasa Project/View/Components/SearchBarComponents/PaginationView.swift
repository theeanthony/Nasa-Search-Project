//
//  PaginationView.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
// Displays the pages available for the search, and allows you to go through pages

import SwiftUI

struct PaginationView: View {
    @ObservedObject var searchViewModel : SearchViewModel
    
    var body: some View {
        VStack{
            
            HStack(spacing:20){
                
                if searchViewModel.currentPage > 1 {
                    Button {
                        searchViewModel.prevPage()

                    } label: {
                        HStack{
                            Image(systemName:"chevron.left")

                            Text("Prev Page")
                        }
                    }
                }
                if searchViewModel.currentPage < 100 {
                    Button {
                        searchViewModel.nextPage()
                    } label: {
                        HStack{
                            Text("Next Page")
                            Image(systemName:"chevron.right")
                        }
                    }
                }
            
                
  
            }
            .padding(.top,5)
 
            Text("\(searchViewModel.currentPage)/\(searchViewModel.totalPageNumbers)")
                .padding(.top,5)
            
        }.foregroundColor(.white)
        
    }
}

//struct PaginationView_Previews: PreviewProvider {
//    static var previews: some View {
//        PaginationView()
//    }
//}
