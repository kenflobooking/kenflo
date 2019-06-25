//
//  NSError+ASCustomError.swift
//  AviasalesSDKTemplate
//
//  Created by Dim on 09.08.2018.
//  Copyright © 2018 Go Travel Un Limited. All rights reserved.
//

import Foundation

extension NSError {

    static func error(code: JRSDKServerAPIError) -> NSError {
        return NSError(domain: "ASErrorDomain", code: code.rawValue, userInfo: nil)
    }
}
