//
//  CircleImage.swift
//  Landmarks
//
//  Created by Daniel Copley on 1/8/22.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
                
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks

    static var previews: some View {
        ZStack {
            CircleImage(image: landmarks[0].image)
                .padding()
        }.background(.white)
    }
}
