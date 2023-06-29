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
    
    @State private var hideMainNasaImage : Bool = false
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                
                if !hideMainNasaImage {
                    
                    Image("nasa")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height:200)
                        .padding(.vertical,100)
//                    Spacer()

                }
                
                
                SearchView(hideMainNasaImage:$hideMainNasaImage)
                    .padding(.vertical,10)
                
            }
            .background(BackgroundView())
        }
        .tint(.white)

   
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
