//
//  Badge.swift
//  Landmarks
//
//  Created by Daniel Copley on 1/9/22.
//

import SwiftUI

struct Badge: View {
    private var badgeSymbols: some View {
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(opacity)
    }

    var body: some View {
        ZStack {
            BadgeBackground()

            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
    
    // MARK: Controls
    private let opacity: Double = 0.5
    private let mountainScale: Double = 0.35
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Badge()
            Badge()
            Badge()
        }
    }
}
