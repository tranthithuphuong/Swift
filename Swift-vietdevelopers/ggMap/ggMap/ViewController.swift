//
//  ViewController.swift
//  ggMap
//
//  Created by chuottp on 25/10/2022.
//

import UIKit
import MapKit


class ViewController: UIViewController{

    @IBOutlet weak var map: MKMapView!


    override func viewDidLoad() {
        super.viewDidLoad()

        let sourceLocation = CLLocationCoordinate2D(latitude: 21.032583467030193, longitude: 105.78496687286035)
        let destinationLocation = CLLocationCoordinate2D(latitude:  21.033982, longitude: 105.849185 )
        
        createPath (sourceLocation: sourceLocation, destinationLocation: destinationLocation)
        self.map.delegate = self
        
        func createPath (sourceLocation : CLLocationCoordinate2D, destinationLocation: CLLocationCoordinate2D) {}
            
            let sourcePlaceMark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
            let destinationPlaceMark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
            
            let sourceMapItem = MKMapItem (placemark: sourcePlaceMark)
            let destinationItem = MKMapItem (placemark: destinationPlaceMark)
            
            let sourceAnotation = MKPointAnnotation()
            sourceAnotation.title = "My Location"
            sourceAnotation.subtitle = "vị trí hiện tại"
            if let location = sourcePlaceMark.location {
                sourceAnotation.coordinate = location.coordinate
            }
            let destinationAnotation = MKPointAnnotation()
            destinationAnotation.title = "46 Hàng Bồ"
            destinationAnotation.subtitle = "nhà người yêu"
            if let location = destinationPlaceMark.location {
                destinationAnotation.coordinate = location.coordinate
            }
            self.map.showAnnotations([sourceAnotation,destinationAnotation], animated: false)
            
            let directionRequest = MKDirections.Request()
            directionRequest.source = sourceMapItem
            directionRequest.destination = destinationItem
            directionRequest.transportType = .automobile
            
            let direction = MKDirections(request: directionRequest)
            
            direction.calculate {(response,error) in
                
                guard let response = response else {
                    if let error = error {
                        print("Loi: \(error.localizedDescription)")
                    }
                    return
                }
                let route = response.routes [0]
                self.map.addOverlay(route.polyline, level: MKOverlayLevel.aboveRoads)
                let rect = route.polyline.boundingMapRect
                self.map.setRegion(MKCoordinateRegion(rect), animated: true)
                
            }
        }
    }
    extension ViewController : MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let rendere = MKPolylineRenderer(overlay: overlay)
rendere.lineWidth = 5
            rendere.strokeColor = .systemRed
            return rendere
    }
    
    
   
}

