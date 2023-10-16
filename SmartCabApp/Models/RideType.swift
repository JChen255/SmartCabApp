//
//  RideType.swift
//  SmartCabApp
//
//  Created by Janine Chen on 10/16/23.
//

import Foundation

enum RideType: Int, CaseIterable, Identifiable{
    case cabX
    case cabBlack
    case cabXL
    
    var id: Int { return rawValue }
    
    var description: String {
        switch self{
        case .cabX: return "CabX"
        case .cabBlack: return "CabBlack"
        case .cabXL: return "CabXL"
        }
    }
    
    var baseFare: Double {
        switch self{
        case .cabX: return 5
        case .cabBlack: return 10
        case .cabXL: return 15
        }
    }
    
    func computePrice(for distanceInMeters: Double) -> Double{
        let distanceInMiles = distanceInMeters / 1600
        switch self{
        case .cabX: return distanceInMiles * 1.5 + baseFare
        case .cabBlack: return distanceInMiles * 1.8 + baseFare
        case .cabXL: return distanceInMiles * 2.0 + baseFare
        }
    }
}
