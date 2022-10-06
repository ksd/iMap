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

final class PinsViewModel: ObservableObject {
    @Published var mapRect = MKMapRect()
    let cities: [City]
    
    init(cities: [City]) {
        self.cities = cities
    }
    
    func fit(){
        let points = cities.map(\.coordinate).map(MKMapPoint.init)
        mapRect = points.reduce(MKMapRect.null){rect, point in
            let newRect = MKMapRect(origin: point, size: MKMapSize())
            return rect.union(newRect)
        }
    }
}

struct ContentView: View {
    
    @ObservedObject var viewModel: PinsViewModel
    
    var body: some View {
        VStack{
            Map(
                mapRect: $viewModel.mapRect,
                annotationItems: viewModel.cities
            ) {
                city in
                MapPin(coordinate: city.coordinate, tint: .accentColor)
            }
            .onAppear(perform: viewModel.fit)
            .ignoresSafeArea()
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: PinsViewModel(cities: [
            City(coordinate: .init(latitude: 40.7128, longitude: 74.006)),
            City(coordinate: .init(latitude: 37.7749, longitude: 122.4194)),
            City(coordinate: .init(latitude: 47.6062, longitude: 122.3321))
        ]))
    }
}
