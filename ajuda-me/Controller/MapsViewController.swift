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
import SwiftyJSON

class MapsViewController: UIViewController {
    
    let apiKey = "AIzaSyBQR4o1QgKELUJ-gpmpBfDONvfTQJ78jnY"
    
    var mapPoints = [ServicePoint]()

    @IBOutlet weak var mapsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        
        Caller.get(url: EndpointBuilder()
            .withBases()
            .getPath(),
             markerFactory)
    
        GMSServices.provideAPIKey(apiKey)
        GMSPlacesClient.provideAPIKey(apiKey)
        
        //Coordenadas de alagoas
        let camera = GMSCameraPosition.camera(withLatitude: -9.6498, longitude: -35.7089, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -9.6498, longitude: -35.7089)
        
        marker.title = "Alagoas"
        marker.snippet = "Brasil"
        marker.map = mapView
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func markerFactory(response: JSON) -> Void {
//        print(response[0]["geometry"].stringValue)
        print(response)
//            print(response[0].stringValue)
        for (index, obj) in response {
            
            let point = ServicePoint()
            point.name = obj["properties"]["Nome"].stringValue
            point.firstCoordinate = obj["geometry"]["coordinates"][0].stringValue
            point.secondCoordinate = obj["geometry"]["coordinates"][1].stringValue
            point.address = obj["properties"]["Endereço"]
            point.city = obj["properties"]["Município"]
            mapPoints.append(point)
            //            point.name = obj["geometry"]["coordinates"]
        }
        
        var marker = GMSMarker()
        marker.title = "Alagoas"
        marker.snippet = "Brasil"
//        return marker
//        marker.map = mapView
    }

}
