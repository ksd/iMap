//
//  ContentView.swift
//  iMap
//
//  Created by ksd on 06/10/2022.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 25.7617,
            longitude: 80.1918),
        latitudinalMeters: 25000,
        longitudinalMeters: 25000
    )
    var body: some View {
        VStack{
            Map(coordinateRegion: $region)
                .ignoresSafeArea()
            Button("zoom") {
                region.span = MKCoordinateSpan(
                    latitudeDelta: 5,
                    longitudeDelta: 5)
                region.center = CLLocationCoordinate2D(
                    latitude: 40.7128,
                    longitude: 74.0060)
            }
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
