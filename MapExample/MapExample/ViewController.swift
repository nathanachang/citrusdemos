//
//  ViewController.swift
//  MapExample
//
//  Created by Nathan Chang on 2/13/25.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    private let map: MKMapView = {
        let map = MKMapView()
        map.showsUserLocation = true
        return map
    }()
    
    var locationData: [LocationData] = []
    let apiClient = APIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(map)
        title = "Citrus"
        
        apiClient.fetchLocations { [weak self] locationData, error in
        // Ensure you're updating the UI on the main thread
            DispatchQueue.main.async {
                guard let strongSelf = self else {
                    return
                }
                
                if let locationData = locationData {
                    strongSelf.locationData = locationData
                } else if let error = error {
                    // Handle the error (e.g., show an alert)
                    print("Error fetching users: \(error.localizedDescription)")
                }
                
                for location in strongSelf.locationData {
                    let pin = MKPointAnnotation()
                    pin.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(floatLiteral: location.lat),
                                                            longitude: CLLocationDegrees(floatLiteral: location.lon))
                    
                    strongSelf.map.addAnnotation(pin)
                }
            }
        }
        
        LocationManager.shared.getUserLocation { [weak self] location in
            DispatchQueue.main.async {
                guard let strongSelf = self else {
                    return
                }
                
                strongSelf.map.setRegion(MKCoordinateRegion(center: location.coordinate,
                                                            span: MKCoordinateSpan(latitudeDelta: 0.005,
                                                                                   longitudeDelta: 0.005)),
                                         animated: true)
                //strongSelf.map.addAnnotation(pin)
            }
        }

        
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        map.frame = view.bounds
    }

}

