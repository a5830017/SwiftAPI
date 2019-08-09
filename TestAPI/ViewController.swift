//
//  ViewController.swift
//  TestAPI
//
//  Created by Jiratip Hemwutthipan on 9/8/2562 BE.
//  Copyright © 2562 ggez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var marvelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTapped() {
        APIManager().getWeather { [weak self] (item) in
            DispatchQueue.main.sync {
                guard let item = item else {
                    return
                }
                self?.marvelLabel.text = "lat" + String(item.coord.lat) + " : " + "lon" + String(item.coord.lon) + " : Display Array : " + String(item.weather[0].main)
            }
        }
    }
    
}
