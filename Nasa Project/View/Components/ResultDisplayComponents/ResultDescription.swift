//
//  ResultDescription.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//
// Showcases the details of the chosen description and date created

import SwiftUI

struct ResultDescription: View {
    var description : String
    var date : String
    var body: some View {
        VStack{
            HStack{
                Text(description).font(.caption).foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(10)
            
            HStack{
                Spacer()
                Text("Date Created: " + date).font(.caption2).foregroundColor(.white.opacity(0.9))
                Spacer()
            }
        }
    }
}

//struct ResultDescription_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultDescription()
//    }
//}
