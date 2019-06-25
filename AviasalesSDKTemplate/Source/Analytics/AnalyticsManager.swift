//
//  AnalyticsManager.swift
//  AviasalesSDKTemplate
//
//  Created by Dim on 08.08.2018.
//  Copyright © 2018 Go Travel Un Limited. All rights reserved.
//

protocol AnalyticsEngine {
    func event(name: String, payload: [String: String])
}

@objc protocol AnalyticsEvent {
    var name: String { get }
    var payload: [String: String] { get }
}

class AnalyticsManager: NSObject {

    private static var engine: AnalyticsEngine?

    static func initialize(with engine: AnalyticsEngine) {
        self.engine = engine
    }

    @objc static func log(event: AnalyticsEvent) {
        if Debug() {
            print("=========== LOG \(event.name) payload: \(event.payload)")
        } else {
            engine?.event(name: event.name, payload: event.payload)
        }
    }
}
