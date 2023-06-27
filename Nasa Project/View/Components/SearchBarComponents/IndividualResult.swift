//
//  IndividualResult.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//
//view of an individual result that will be used to display an image and title of the search results 

import SwiftUI

struct IndividualResult: View {
    
    let image = Image("nasa")
    let title = "Title"
    var body: some View {
        HStack{
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height:50)
                .background(Rectangle().stroke(.red,lineWidth: 1))
            Text(title)
                .foregroundColor(.white)
            
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
        }
        .padding(.horizontal,5)
        .padding(.vertical,2)
    }
}

struct IndividualResult_Previews: PreviewProvider {
    static var previews: some View {
        IndividualResult()
    }
}
