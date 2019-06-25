//
//  JRSDKSearchInfo+Type.swift
//  AviasalesSDKTemplate
//
//  Created by Dim on 04.09.2018.
//  Copyright © 2018 Go Travel Un Limited. All rights reserved.
//

extension JRSDKSearchInfo {

    func typeRepresentation() -> String {
        switch JRSDKModelUtils.searchInfoType(self) {
        case .oneWayType:
            return "Oneway"
        case .directReturnType:
            return "Return"
        case .complexType:
            return "Multicity"
        }
    }
}
