//
//  AsyncImageView.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//
// Custom async image that handles empty, success, failure to load, and default cases

import SwiftUI

struct AsyncImageView: View {
    
    var url : String
    var width : CGFloat
    var height : CGFloat
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                // Placeholder view while the image is loading
                CustomProgressView(width: width/2, height: height/2)
                    .frame(width:width,height:height)

            case .success(let image):
                // Display the loaded image
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:width,height:height)
                    .clipShape(Rectangle())
            case .failure(let error):
                // Handle the failure case
                VStack{
                    Text("Failed to load image: \(error.localizedDescription)")
                    .foregroundColor(.white)
                        .background(Rectangle().fill(.gray))
                                    }
                            .frame(width:width,height:height)
            @unknown default:
                // Handle unknown cases
                EmptyView()
            }
        }
    }
}

//struct AsyncImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        AsyncImageView()
//    }
//}
