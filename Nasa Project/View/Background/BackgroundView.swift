//
//  BackgroundView.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//
// This serves as the main view to be called when applying a background to views. Add/delete componenets in here. 
import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Color.black
                    .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
