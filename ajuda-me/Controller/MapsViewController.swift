//
//  MapsViewController.swift
//  ajuda-me
//
//  Created by Alexandre Henrique on 6/6/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import UIKit
import RealmSwift
import GoogleMaps
import GooglePlaces
import SwiftyJSON

class MapsViewController: UIViewController {
    
    let apiKey = "AIzaSyBQR4o1QgKELUJ-gpmpBfDONvfTQJ78jnY"
    var mapPoints = [ServicePoint]()
    var markers = [GMSMarker]()
    let realm = try! Realm()
    var servicePointLocalDataSource: ServicePointDataSource?
    
    @IBOutlet weak var mapsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        servicePointLocalDataSource = ServicePointDataSourceImpl.getInstance(realm: realm)
        mapPoints = (servicePointLocalDataSource?.findAll())!
    }
    
    override func loadView() {
        
        Caller.get(url: EndpointBuilder()
            .withBases()
            .getPath(),
             markerFactory)
    
        GMSServices.provideAPIKey(apiKey)
        GMSPlacesClient.provideAPIKey(apiKey)
        
        //Coordenadas de alagoas
        let camera = GMSCameraPosition.camera(withLatitude: -9.665203, longitude: -35.731192, zoom: 14.5)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -9.665203, longitude: -35.731192)
        
        marker.title = "Alagoas"
        marker.snippet = "Brasil"
        marker.map = mapView
        
        mapPoints.forEach { point in
            let newMarker = GMSMarker()
            
            newMarker.title = point.name
            newMarker.snippet = point.city
            newMarker.position = CLLocationCoordinate2DMake(Double(point.firstCoordinate)!, Double(point.secondCoordinate)!)
            
            newMarker.map = mapView
        }
    
    }
    
    func markerFactory(response: JSON) -> Void {

        for (index, obj) in response {
            
            let point = ServicePoint()
            point.name = obj["properties"]["Nome"].stringValue
            point.firstCoordinate = obj["geometry"]["coordinates"][0].stringValue
            point.secondCoordinate = obj["geometry"]["coordinates"][1].stringValue
            point.address = obj["properties"]["Endereço"].stringValue
            point.city = obj["properties"]["Município"].stringValue
            servicePointLocalDataSource?.save(entity: point)
            mapPoints.append(point)
        }
        
        var marker = GMSMarker()
        marker.title = "Alagoas"
        marker.snippet = "Brasil"
        markers.append(marker)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
