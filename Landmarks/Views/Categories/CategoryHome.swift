//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Daniel Copley on 1/9/22.
//

import SwiftUI

struct CategoryHome: View {
    // MARK: Bindings
    @EnvironmentObject var modelData: ModelData
    @State private var timer = Timer.publish(every: Self.timerPeriod, on: .main, in: .common).autoconnect()
    @State private var featuredViewArrayIndex = 0
    @State private var showingProfile = false

    // MARK: UI Elements
    var body: some View {
        let featuredViewArray = modelData.featuredLandmarks.map { FeaturedView(landmark: $0) }
        
        NavigationView {
            ScrollView {
                VStack {
                    if !featuredViewArray.isEmpty {
                        ForEach(featuredViewArray.indices) { index in
                            if index == featuredViewArrayIndex {
                                featuredViewArray[featuredViewArrayIndex]
                                    .transition(.slide)
                            }
                        }
                        .onAppear {
                            // Start the timer while the featured item is on display
                            startTimer()
                        }
                        .onDisappear {
                            // Stop the timer when the app switches views
                            stopTimer()
                        }
                        .onReceive(timer) { _ in
                            // Animate view change when timer publishes event
                            withAnimation(.easeIn) {
                                featuredViewArrayIndex += 1
                                if featuredViewArrayIndex >= featuredViewArray.count {
                                    featuredViewArrayIndex = 0
                                }
                            }
                        }
                    }
                    ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(name: key, landmarks: modelData.categories[key] ?? [])
                            .padding(.bottom, 10)
                    }
                }
            }
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
    
    // MARK: Timer start/stop
    private func stopTimer() {
        self.timer.upstream.connect().cancel()
    }
    
    private func startTimer() {
        self.timer = Timer.publish(every: Self.timerPeriod, on: .main, in: .common).autoconnect()
    }
    
    // MARK: Constants
    private static let timerPeriod: TimeInterval = 10
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
