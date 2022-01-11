//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Daniel Copley on 1/9/22.
//

import SwiftUI
import Combine


struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State var timer: Publishers.Autoconnect<Timer.TimerPublisher>
    @State var featuredViewArrayIndex = 0
    
    init() {
        timer = Timer.publish(every: Self.timerPeriod, on: .main, in: .common).autoconnect()
    }

        
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
                            startTimer()
                        }
                        .onDisappear {
                            stopTimer()
                        }
                        .onReceive(timer) { _ in
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
