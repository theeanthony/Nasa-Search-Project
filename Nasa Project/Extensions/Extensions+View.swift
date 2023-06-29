//
//  Extensions+View.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/29/23.
//

import Foundation
import SwiftUI
extension View {
    
    //placeholder edits the alignment and color of the default placeholder text for Textfield
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        color: Color = Color.white,
        @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            placeholder().foregroundColor(color).opacity(shouldShow ? 1 : 0)

            self
        }
            
    }
}
