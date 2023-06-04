//
//  Superkahraman.swift
//  SuperHeroes
//
//  Created by Emir Keleş on 3.06.2023.
//

import Foundation
import SwiftUI
import CoreLocation


struct Superkahraman : Identifiable {
    var id = UUID()
    var isim : String
    var gercekIsim : String
    var gorselIsmi : String
    var sehir : String
    var meslek : String
    var koordinat : Koordinat
    
    var koordinatLokasyonu : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: koordinat.latitude, longitude: koordinat.longitude)
    }
    
    
    
}

struct Koordinat {
    var latitude : Double
    var longitude : Double
}

let batman = Superkahraman(isim: "Batman", gercekIsim: "Bruce Wayne", gorselIsmi: "batman", sehir: "Gotham", meslek: "İş Adamı", koordinat: Koordinat(latitude: 41.8713, longitude: -87.7669))

let superman = Superkahraman(isim: "Superman", gercekIsim: "Clark Kent", gorselIsmi: "superman", sehir: "Kansas", meslek: "Gazeteci", koordinat: Koordinat(latitude: 39.0865, longitude: -94.7089))

let spiderman = Superkahraman(isim: "Spiderman", gercekIsim: "Peter Parker", gorselIsmi: "spiderman", sehir: "New York", meslek: "Fotoğrafçı", koordinat: Koordinat(latitude: 40.7160, longitude: -74.0524))

let ironman = Superkahraman(isim: "Iron Man", gercekIsim: "Tony Stark", gorselIsmi: "ironman", sehir: "Los Angeles", meslek: "İş Adamı", koordinat: Koordinat(latitude: 33.8003, longitude: -118.2261))

let superKahramanDizisi = [batman, superman, spiderman, ironman]
