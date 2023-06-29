//
//  SearchResults.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//
// a view of the results that come up when a search is completed contained within a list 
import SwiftUI

struct SearchResults: View {
    
    @ObservedObject var searchViewModel: SearchViewModel
    @State private var showError : Bool = false
    
    @Binding var logoShowing : Bool
    
    var body: some View {
        VStack{
            
            if searchViewModel.loadingSearch{
                HStack{
                    CustomProgressView(width: 80, height: 80)
                }
            }else if !searchViewModel.searchResults.isEmpty{
                List(searchViewModel.searchResults) { result in
                    NavigationLink(destination: DetailsView(result:result)) {
                        IndividualResult(result: result)
                            .listRowBackground(Color.black.opacity(0.6))
                            .listRowSeparatorTint(.white.opacity(0.8))
                    }
                    
                    .listRowBackground(Color.black)

                    .buttonStyle(PlainButtonStyle())

                }
                .listRowSeparator(.hidden)
                .listStyle(.plain)
                .listRowBackground(Color.black)

            }
                
                else if logoShowing && searchViewModel.searchResults.isEmpty {
                    SearchCases(searchViewModel: searchViewModel)
                }
            
            if searchViewModel.totalPageNumbers != 0 {
                PaginationView(searchViewModel: searchViewModel)

            }


     
        }
        .background(BackgroundView())
        .onChange(of: searchViewModel.fetchStatus) { newValue in
            if newValue != .AllGood{
                self.showError = true
            }
        }
        .alert(isPresented: $showError) {
            Alert(
                title: Text("Error"),
                message: searchViewModel.fetchStatus.showAlert(),
                dismissButton: .cancel(
                    Text("Ok"),
                    action: {
                    }
                )
            )
        }

    }
}

//struct SearchResults_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResults()
//    }
//}
