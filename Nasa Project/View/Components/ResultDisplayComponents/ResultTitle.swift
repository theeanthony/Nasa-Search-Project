//
//  ResultTitle.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//
// Showcases the details of the chosen title

import SwiftUI

struct ResultTitle: View {
    
    var title : String
    var body: some View {
        VStack{
            HStack{
                Text(title).font(.largeTitle).foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(10)
        }
    }
}

//struct ResultTitle_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultTitle()
//    }
//}
