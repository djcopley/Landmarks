//
//  FeaturedView.swift
//  Landmarks
//
//  Created by Daniel Copley on 1/9/22.
//

import SwiftUI

struct FeaturedView: View {
    var landmark: Landmark
    
    var body: some View {
        NavigationLink {
            LandmarkDetail(landmark: landmark)
        } label: {
            ZStack(alignment: .bottomLeading) {
                landmark.image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: roundedRectangleRadius))
                    .overlay(
                        RoundedRectangle(cornerRadius: roundedRectangleRadius)
                            .stroke(.white, lineWidth: strokeLineWidth)
                    )
                    .shadow(radius: shadowRadius)
                    .aspectRatio(1, contentMode: .fill)
                    .padding()
                Text(landmark.name)
                    .font(.title)
                    .foregroundColor(.white)
                    .offset(x: CGFloat(textOffset), y: CGFloat(-textOffset))
            }
        }
    }
    
    // MARK: Constants
    private let textOffset: CGFloat = 25
    private let strokeLineWidth: CGFloat = 4
    private let roundedRectangleRadius: CGFloat = 15
    private let shadowRadius: CGFloat = 7
}

struct FeaturedView_Previews: PreviewProvider {
    static var test: Landmark = ModelData().featuredLandmarks.first!

    static var previews: some View {
        FeaturedView(landmark: test)
            .environmentObject(ModelData())
            .frame(width: 300, height: 300)
    }
}
