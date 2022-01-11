//
//  LandmarkDetail.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Daniel Copley on 1/11/22.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                                
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }

                Divider()

                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(1)

                Text(landmark.state)
                    .font(.caption)

                Divider()

                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
            }
            .padding()
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        Group {
            LandmarkDetail(landmark: modelData.landmarks.first!)
                .environmentObject(modelData)
                .previewDevice(PreviewDevice(rawValue: "Apple Watch Series 7 - 45mm"))
                .previewDisplayName("Apple Watch Series 7 - 45mm")
            LandmarkDetail(landmark: modelData.landmarks.first!)
                .environmentObject(modelData)
                .previewDevice(PreviewDevice(rawValue: "Apple Watch Series 6 - 40mm"))
                .previewDisplayName("Apple Watch Series 6 - 40mm")
        }
    }
}
