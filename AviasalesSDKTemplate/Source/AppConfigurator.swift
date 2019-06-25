//
//  AppConfigurator.swift
//  AviasalesSDKTemplate
//
//  Created by Dim on 22.11.2017.
//  Copyright © 2017 Go Travel Un Limited. All rights reserved.
//

import Foundation
import Appodeal
import Firebase

class AppConfigurator: NSObject {

    @objc static func configure() {
        configureAviasalesSDK()
        configureAnalytics()
        configureAppodeal()
    }
}

private extension AppConfigurator {

    static func configureAviasalesSDK() {

        let token = ConfigManager.shared.apiToken
        let marker = ConfigManager.shared.partnerMarker
        let locale = Locale.current.identifier

        if token.isEmpty {
            fatalError("Invalid token")
        }

        if marker.isEmpty {
            fatalError("Invalid marker")
        }

        let configuration = AviasalesSDKInitialConfiguration(apiToken: token, apiLocale: locale, partnerMarker: marker)

        AviasalesSDK.setup(with: configuration)
    }

    static func configureAnalytics() {
        if ConfigManager.shared.firebaseEnabled {
            FirebaseApp.configure()
            AnalyticsManager.initialize(with: FirebaseAnalyticsEngine())
        }
    }

    static func configureAppodeal() {
        Appodeal.initialize(withApiKey: ConfigManager.shared.appodealKey, types: .interstitial)
    }
}
