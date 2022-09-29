//
//  Map.swift
//  ForestSurvive
//
//  Created by Jakub Chodara on 28/09/2022.
//

import SwiftUI
import MapKit
import CoreLocation

struct Map: View {
    
    @State public var directions: [String] = []
    @State private var showDirections = false
    @State public var long = 20.900672
    @State public var lat = 52.253188
    @State private var OK = true

    
    var body: some View {
       // var mapView = MapView(directions: $directions, long: $long, lat: $lat)

        
        VStack{
            HStack {
                       TextField("Enter your latitude", value: $lat, format: .number)
                           .textFieldStyle(.roundedBorder)
                           .padding()
                        TextField("Enter your longitude", value: $long, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                
                Button(action: {

                }, label: {
                    Text("OK")
                })
                   }
            //mapView

                MapView(directions: $directions, long: $long, lat: $lat)


            
            Button(action: {
                self.showDirections.toggle()
            }, label: {
                Text("Show directions")
            })
            .disabled(directions.isEmpty)
            .padding()

        }.sheet(isPresented: $showDirections, content: {
            VStack{
                Text("Directions")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Divider().background(Color.blue)
                
                List{
                    ForEach(0..<self.directions.count, id: \.self){ i in
                        Text(self.directions[i])
                            .padding()
                    }
                }
            }
        })
    }
}

struct Map_Previews: PreviewProvider {

    static var previews: some View {
        Map()
    }
}


struct MapView: UIViewRepresentable {
    typealias UIViewType = MKMapView
    
    @Binding var directions: [String]
    @Binding var long: Double
    @Binding var lat: Double
    
    
    func makeCoordinator() -> MapViewCoordinator{
        return MapViewCoordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        //seting a region that will be shown at the beginning
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: long), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        mapView.setRegion(region , animated: true)
        


        
      
    
        
        //NYC
        let p1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long))
        //Boston
        let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 52.239012, longitude: 20.913964))
        
        let request = MKDirections.Request()
        request.source=MKMapItem(placemark: p1)
        request.destination=MKMapItem(placemark: p2)
        //type of a transport tha will be shown route for
        request.transportType = .walking
        
        let directions = MKDirections(request: request)
        directions.calculate {response, error in
            guard let route = response?.routes.first else { return }
            mapView.addAnnotations([p1, p2])
            //draw a line between our two preset points
            mapView.addOverlay(route.polyline)
            mapView.setVisibleMapRect(route.polyline.boundingMapRect,edgePadding: UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25), animated: true)
            self.directions = route.steps.map { $0.instructions}.filter {!$0.isEmpty}
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate{
        func mapView(_ mapView: MKMapView,  rendererFor overlay: MKOverlay) ->MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .red
            renderer.lineWidth = 5
            return renderer
        }
    }
}




