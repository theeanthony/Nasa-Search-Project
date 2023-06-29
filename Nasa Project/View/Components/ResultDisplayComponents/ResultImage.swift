//
//  ResultImage.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//
// Showcases the details of the chosen Image

import SwiftUI

struct ResultImage: View {
    
    var imageURL : String
    var body: some View {
        AsyncImageView(url: imageURL, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height * 0.5)
    }
}

//struct ResultImage_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultImage()
//    }
//}
