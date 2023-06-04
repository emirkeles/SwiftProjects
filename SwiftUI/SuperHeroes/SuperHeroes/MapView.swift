//
//  MapView.swift
//  SuperHeroes
//
//  Created by Emir Keleş on 3.06.2023.
//

import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    
    
    var coordinate : CLLocationCoordinate2D
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: superKahramanDizisi[0].koordinatLokasyonu)
    }
}
