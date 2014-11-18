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
import CoreMotion

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var pitch: UILabel!
    @IBOutlet weak var altitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var Latitude: UILabel!
    @IBOutlet weak var roll: UILabel!
    @IBOutlet weak var yaw: UILabel!
    
    let locationManager = CLLocationManager()
    let motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        self.motionManager.deviceMotionUpdateInterval = 0.1
        self.motionManager.startDeviceMotionUpdates()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        self.displayLocationInfo(manager.location)
    }
    
    func displayLocationInfo(location: CLLocation) {
        
        if let attitude = motionManager.deviceMotion?.attitude? {
              self.pitch.text = "Pitch: " + String(format: "%i", Int(motionManager.deviceMotion.attitude.pitch*57.2957795131)) + "°"
            self.roll.text = "Roll: " + String(format: "%i", Int(motionManager.deviceMotion.attitude.roll*57.2957795131)) + "°"
            self.yaw.text = "Yaw: " + String(format: "%i", Int(motionManager.deviceMotion.attitude.yaw*57.2957795131)) + "°"
        }
      
        self.Latitude.text = "Latitude: " + String(format: "%f", location.coordinate.latitude )
        self.longitude.text = "Longitude: " + String(format: "%f", location.coordinate.longitude)
        self.altitude.text = "Altitude: " + String(format: "%f", location.altitude)


       /* println("Latitude: ", location.coordinate.latitude)
        println("Longitude: ", location.coordinate.longitude)
        println("Altitude: ", location.altitude)
        println("Horizontal Accuracy: ", location.horizontalAccuracy)
        println("Vertical Accuracy: ", location.verticalAccuracy)
        println("Timestamp: ", location.timestamp)
        println("Description: ", location.description)
*/
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error: " + error.localizedDescription)
    }


}

