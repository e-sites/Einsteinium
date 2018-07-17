//
//  CLLocationCoordinate2D.swift
//  Einsteinium
//
//  Created by Bas van Kuijck on 26-11-15.
//  Copyright © 2015 E-sites. All rights reserved.
//

import Foundation
import CoreGraphics
import CoreLocation

extension CLLocationCoordinate2D {
    public func distanceFromCoordinate(coordinate: CLLocationCoordinate2D) -> CLLocationDistance {
        let loc1 = CLLocation(latitude: latitude, longitude: longitude)
        let loc2 = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        return loc1.distance(from: loc2)
    }
    
    public func getBearing(to coordinate: CLLocationCoordinate2D) -> CGFloat {
        
        let lat1 = latitude.toRadians()
        let lon1 = longitude.toRadians()
        
        let lat2 = coordinate.latitude.toRadians()
        let lon2 = coordinate.longitude.toRadians()
        
        let dLon = lon2 - lon1
        
        let yPos = sin(dLon) * cos(lat2)
        let xPos = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)
        let radiansBearing = atan2(yPos, xPos)
        
        return radiansBearing.toDegrees()
    }
    
    public func coordinate(withBearing bearing: Double, distance: Double) -> CLLocationCoordinate2D {
        let bearingRadians = Double(bearing.toRadians())
        let distRadians = distance / 6_372_797.6 // earth radius in meters
        
        let lat1 = Double(latitude.toRadians())
        let lon1 = Double(longitude.toRadians())
        
        let lat2 = asin(sin(lat1) * cos(distRadians) + cos(lat1) * sin(distRadians) * cos(bearingRadians))
        let lon2 = lon1 + atan2(sin(bearingRadians) * sin(distRadians) * cos(lat1),
                                cos(distRadians) - sin(lat1) * sin(lat2))
        
        return CLLocationCoordinate2D(latitude: Double(lat2.toDegrees()), longitude: Double(lon2.toDegrees()))
    }
}
