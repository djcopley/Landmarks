//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Daniel Copley on 1/8/22.
//

import SwiftUI

struct LandmarkRow: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(rowCornerRadius)
            VStack(alignment: .leading){
                Text(landmark.name)
                    .font(.headline)
                #if !os(watchOS)
                Text(landmark.park)
                    .font(.subheadline)
                    .lineLimit(1)
                #endif
            }
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
    
    // MARK: Constants
    private let rowCornerRadius: CGFloat = 6
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks

    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
