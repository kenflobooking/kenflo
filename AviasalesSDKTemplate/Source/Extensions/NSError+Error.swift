//
//  NSError+Error.swift
//  AviasalesSDKTemplate
//
//  Created by Dim on 21.09.2018.
//  Copyright © 2018 Go Travel Un Limited. All rights reserved.
//

extension NSError {

    @objc var isCancelled: Bool {
        return (self as Error).isCancelled
    }
}
