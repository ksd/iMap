//
//  ContentView.swift
//  iMap
//
//  Created by ksd on 06/10/2022.
//

import SwiftUI
import MapKit

struct City: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}



struct ContentView: View {
    @State private var cities = [
        City(coordinate: .init(latitude: 40.7128, longitude: 74.006)),
        City(coordinate: .init(latitude: 37.7749, longitude: 122.4194)),
        City(coordinate: .init(latitude: 47.6062, longitude: 122.3321))
    ]
    //@State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 25.7617, longitude: 80.1918),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $region, annotationItems: cities){ city in
                MapAnnotation(coordinate: city.coordinate) {
                    Circle()
                        .stroke(Color.red)
                        .frame(width: 44, height: 44)
                }
            }
                .ignoresSafeArea()
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
