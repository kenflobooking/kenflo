//
//  HLSearchInfoType+Description.swift
//  AviasalesSDKTemplate
//
//  Created by Dim on 06.09.2018.
//  Copyright © 2018 Go Travel Un Limited. All rights reserved.
//

extension HLSearchInfoType {

    func description() -> String {
        switch self {
        case .unknown:
            return "Unknown"
        case .city:
            return "City"
        case .hotel:
            return "Hotel"
        case .userLocation:
            return "User Location"
        case .cityCenterLocation:
            return "City Center Location"
        case .airport:
            return "Airport"
        case .customLocation:
            return "Custom Location"
        }
    }
}
