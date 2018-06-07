//
//  GoogleMapsInitializer.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 6/5/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
import GoogleMaps
import GooglePlaces

public class GoogleMapsInitializer {
    
    static let apiKey = "AIzaSyBQR4o1QgKELUJ-gpmpBfDONvfTQJ78jnY"
    
    class func generateMap(view: inout UIView) {
        GMSServices.provideAPIKey(self.apiKey)
        GMSPlacesClient.provideAPIKey(self.apiKey)
        
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -9.5713, longitude: 36.7820)
        //Coordenadas de alagoas
        marker.title = "Alagoas"
        marker.snippet = "Brasil"
        marker.map = mapView
    }
}

