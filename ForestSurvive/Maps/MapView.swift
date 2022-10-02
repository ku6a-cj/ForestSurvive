//
//  MapView.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 02/10/2022.
//

import SwiftUI
import MapKit
import CoreLocation
import Contacts

struct MapVie: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    let dictionary1 = [CNPostalAddressStreetKey: "Your location", CNPostalAddressCityKey: "", CNPostalAddressPostalCodeKey: "", CNPostalAddressISOCountryCodeKey: "PL"]
    @State var p1=MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0))

    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        let dictionary1 = [CNPostalAddressStreetKey: "Your location", CNPostalAddressCityKey: "", CNPostalAddressPostalCodeKey: "", CNPostalAddressISOCountryCodeKey: "PL"]
        let p2 = MKPlacemark(coordinate: coordinate, addressDictionary: dictionary1)
        //set marker
        let annotations = view.annotations
        view.removeAnnotations(annotations)
        view.addAnnotation(p2)
        //zoom on location
        view.setRegion(region, animated: true)
        
    }
}
