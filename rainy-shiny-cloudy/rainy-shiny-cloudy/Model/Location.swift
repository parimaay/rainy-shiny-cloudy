//
//  Location.swift
//  rainy-shiny-cloudy
//
//  Created by Parima Ayazi on 25/03/2018.
//  Copyright © 2018 Parima Ayazi. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init(){}
    
    var latitude: Double!
    var longitude: Double!
    
    
}
