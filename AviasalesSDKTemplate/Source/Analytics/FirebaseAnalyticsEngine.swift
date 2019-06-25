//
//  FirebaseAnalyticsEngine.swift
//  AviasalesSDKTemplate
//
//  Created by Dim on 08.08.2018.
//  Copyright © 2018 Go Travel Un Limited. All rights reserved.
//

import Firebase

class FirebaseAnalyticsEngine: AnalyticsEngine {

    func event(name: String, payload: [String : String]) {
        Analytics.logEvent(name, parameters: payload)
    }
}
