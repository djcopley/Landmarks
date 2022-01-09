//
//  CircleImage.swift
//  Landmarks
//
//  Created by Daniel Copley on 1/8/22.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
                
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            CircleImage()
                .padding()
        }.background(.white)
    }
}