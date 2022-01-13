//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Daniel Copley on 1/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        ContentView()
            .environmentObject(modelData)
    }
}
