//
//  CustomProgressView.swift
//  Nasa Project
//
//  Created by Anthony Contreras on 6/27/23.
//
// Shows a custom loading screen
import SwiftUI


struct CustomProgressView: View {
    @State private var isAnimating = false
    
    var width: CGFloat
    var height : CGFloat
    var body: some View {
        VStack {
//            Color.black.opacity(0.4).ignoresSafeArea()
            Spacer()
            HStack{
                Spacer()
                Circle()
                    .trim(from: 0, to: 0.8)
                    .stroke(Color.white, lineWidth: 3)
                    .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .frame(width: width, height: height)
                Spacer()
            }
            
            Spacer()
        }
//        .background(MainBackgroundView())
        .onAppear {
            isAnimating = true
        }
    }
}

//struct CustomProgressView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomProgressView()
//    }
//}
