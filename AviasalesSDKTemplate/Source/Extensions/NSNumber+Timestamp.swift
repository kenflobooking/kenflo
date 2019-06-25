//
//  NSNumber+Timestamp.swift
//  AviasalesSDKTemplate
//
//  Created by Dim on 04.09.2018.
//  Copyright © 2018 Go Travel Un Limited. All rights reserved.
//

extension NSNumber {

    func formattedTimestampRepresentation(formatter: DateFormatter) -> String {
        let date = Date(timeIntervalSince1970: self.doubleValue)
        return formatter.string(from: date)
    }
}
