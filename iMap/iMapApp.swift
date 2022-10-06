//
//  iMapApp.swift
//  iMap
//
//  Created by ksd on 06/10/2022.
//

import SwiftUI

@main
struct iMapApp: App {

    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: PinsViewModel(cities: [
                City(coordinate: .init(latitude: 40.7128, longitude: 74.006)),
                City(coordinate: .init(latitude: 37.7749, longitude: 122.4194)),
                City(coordinate: .init(latitude: 47.6062, longitude: 122.3321))
            ]))
        }
    }
}
