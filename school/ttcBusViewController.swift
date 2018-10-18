//
//  ViewController.swift
//  testAlamofire
//
//  Created by 邱子昂 on 2018/9/21.
//  Copyright © 2018年 邱子昂. All rights reserved.
//

import UIKit

import SwiftBus
class ttcBusViewController: UIViewController {
    
    //set 4 bus prediction time

    
    //for Coney road East stop is 8619, for the Coney road West stop is 2586.
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func getPRedictionTime(RouteTag:String,StopTag:String) {
        SwiftBus.shared.stopPredictions(forStopTag: StopTag, onRouteTag: RouteTag, withAgencyTag: "ttc") { result in
            
            switch result {
            case let .success(stop):
                let predictionStrings: [Int] = stop.allPredictions.map({ $0.predictionInMinutes })
                
                print("\n-----")
                print("Stop: \(stop.stopTitle)")
                print("Predictions at stop \(predictionStrings) mins")
                
                self.showAlertControllerWithTitle("Stop Predictions for stop \(stop.stopTitle)", message: "\(predictionStrings) mins")
            case let .error(error):
                self.showAlertControllerWithTitle("Error", message: error.localizedDescription)
            }
        }
    }
    
    @IBAction func RoyalYork15(_ sender: Any) {
        getPRedictionTime(RouteTag: "15", StopTag: "2586")
    }
    @IBAction func RoyalYork76(_ sender: Any) {
        getPRedictionTime(RouteTag: "76", StopTag: "2586")
    }
    @IBAction func Sherway15(_ sender: Any) {
        getPRedictionTime(RouteTag: "15", StopTag: "8619")
    }
    @IBAction func LakeShore76(_ sender: Any) {
        getPRedictionTime(RouteTag: "76", StopTag: "8619")
    }
    
    func showAlertControllerWithTitle(_ title: String, message: String) {
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }


}

