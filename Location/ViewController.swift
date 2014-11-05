//
//  ViewController.swift
//  Location
//
//  Created by AR Comps Group on 10/29/14
//
//
//  Based on code by PJ Vea from 10/18/14.
//  Copyright (c) 2014 Vea Software. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        self.displayLocationInfo(manager.location)
    }
    
    func displayLocationInfo(location: CLLocation) {
        
        self.locationManager.stopUpdatingLocation()
        println("Latitude: ", location.coordinate.latitude)
        println("Longitude: ", location.coordinate.longitude)
        println("Altitude: ", location.altitude)
        println("Horizontal Accuracy: ", location.horizontalAccuracy)
        println("Vertical Accuracy: ", location.verticalAccuracy)
        println("Timestamp: ", location.timestamp)
        println("Description: ", location.description)
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error: " + error.localizedDescription)
    }


}

