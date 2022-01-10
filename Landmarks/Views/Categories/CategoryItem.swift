//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Daniel Copley on 1/9/22.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack (alignment: .center) {
            ZStack (alignment: .bottomTrailing) {
                landmark.image
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
                if landmark.isFavorite {
                    let size: CGFloat = 20
                    Image(systemName: "star.fill")
                        .resizable()
                        .foregroundColor(.yellow)
                        .frame(width: size, height: size, alignment: .center)
                        .offset(x: CGFloat(-size), y: CGFloat(-size))
                }
            }
            Text(landmark.name)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
    
    private let cornerRadius: CGFloat = 20
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks.first!)
    }
}
