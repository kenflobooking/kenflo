//
//  ConfigProvider.swift
//  AviasalesSDKTemplate
//
//  Created by Dim on 21.11.2017.
//  Copyright © 2017 Go Travel Un Limited. All rights reserved.
//

protocol ConfigProviderProtocol {
    
}

extension ConfigProviderProtocol {

    func obtainConfig() -> Config? {
        return defaultConfig()
    }

    func defaultConfig() -> Config {

        let resource = "default_config"

        guard let url = Bundle.main.url(forResource: resource, withExtension: "plist") else {
            fatalError("\(resource) has not found")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("\(resource) has not been loaded")
        }

        guard let config = try? PropertyListDecoder().decode(Config.self, from: data) else {
            fatalError("\(resource) decode error")
        }

        return config
    }
}

class ConfigProvider: ConfigProviderProtocol {

}
