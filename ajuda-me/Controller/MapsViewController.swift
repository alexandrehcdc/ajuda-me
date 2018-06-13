//
//  MapsViewController.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 6/6/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapsViewController: UIViewController {
    
    let apiKey = "AIzaSyBQR4o1QgKELUJ-gpmpBfDONvfTQJ78jnY"

    @IBOutlet weak var mapsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
    
        GMSServices.provideAPIKey(apiKey)
        GMSPlacesClient.provideAPIKey(apiKey)
        
        let camera = GMSCameraPosition.camera(withLatitude: -9.6498, longitude: -35.7089, zoom: 0.0)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -9.6498, longitude: -35.7089)
        //Coordenadas de alagoas
        marker.title = "Alagoas"
        marker.snippet = "Brasil"
        marker.map = mapView
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
