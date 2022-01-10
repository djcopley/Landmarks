//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Daniel Copley on 1/9/22.
//

import SwiftUI

struct CategoryRow: View {
    var name: String
    var landmarks: [Landmark]
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(name)
                .font(.title2)
                .padding(.top, 10)
                .padding(.leading, 5)
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack (alignment: .top, spacing: 0) {
                    ForEach(landmarks) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        CategoryRow(name: "Lakes", landmarks: modelData.categories["Lakes"] ?? [])
            .environmentObject(modelData)
    }
}
