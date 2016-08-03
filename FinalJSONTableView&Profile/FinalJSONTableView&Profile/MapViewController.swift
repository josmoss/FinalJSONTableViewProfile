//
//  MapViewController.swift
//  FinalJSONTableView&Profile
//
//  Created by Joe Moss on 8/2/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var theMap: Destination!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: theMap.latitude, longitude: theMap.longitude)
        
        print(theMap.latitude)
        print(theMap.longitude)
        
        self.addCustomPin(theMap.latitude, long: theMap.longitude, titleString: theMap.name)
        
        self.centerMapOnLocation(initialLocation)
    }
    
    let regionRadius: CLLocationDistance = 80000
        
    func centerMapOnLocation(location: CLLocation) {
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
    
    func addPin(latitude: Double, longitude: Double, titleString: String) {
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = titleString
        
        self.mapView.addAnnotation(annotation)
        
    }
        
    func addCustomPin(lat: Double, long: Double, titleString: String) {
        
        let location = CLLocationCoordinate2D(
            latitude: theMap.latitude,
            longitude: theMap.longitude
            )
        
        let customAnnotation = CustomMKPointAnnotation()
        
        customAnnotation.coordinate = location
        customAnnotation.title = theMap.name
        
        self.mapView.addAnnotation(customAnnotation)
        
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation.isKindOfClass(CustomMKPointAnnotation) {
            
            print("Got a custom MKPointAnnotation")
            
            let identifier = "MapPin"
            
            let annotationView = MKAnnotationView(
                annotation: annotation,
                reuseIdentifier: identifier
            )
            
            annotationView.canShowCallout = true
            
            let imageView = UIImageView(frame: CGRectMake(0, 0, 44, 44))
            imageView.image = UIImage(named: "mapPins")
            
            annotationView.image = imageView.image
            
            return annotationView
            
        }
        
        return nil
        
    }
    
}
