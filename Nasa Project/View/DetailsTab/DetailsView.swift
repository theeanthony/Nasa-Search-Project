//
//  DetailsView.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//
// Showcases the details of the chosen search result 
import SwiftUI

struct DetailsView: View {
    var result : SearchResultModel
    var body: some View {
        VStack{
            ScrollView{
                ResultImage(imageURL: result.imageURL)
                ResultTitle(title: result.title)
                
                ResultDescription(description: result.description, date: result.date)
            }
            .padding(.vertical,1)
        }
        .onAppear {
            UINavigationBar.appearance().tintColor = .white 
        }
        .background(BackgroundView())
    }
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView()
//    }
//}
