//
//  Config.swift
//  AviasalesSDKTemplate
//
//  Created by Dim on 07.08.17.
//  Copyright © 2017 Go Travel Un Limited. All rights reserved.
//

struct Config: Codable {
    
    var partnerMarker: String?
    var apiToken: String?
    var appodealKey: String?
    var flightsEnabled: Bool?
    var hotelsEnabled: Bool?
    var appLogo: String?
    var appNames: [String : String]?
    var appDescriptions: [String : String]?
    var feedbackEmail: String?
    var itunesLink: String?
    var externalLinks: [String : [ExternalLink]]?
    var colorParams: ColorParams?
    var searchParams: SearchParams?
    var defaultLocale: String?
    var firebaseEnabled: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case partnerMarker = "partner_marker"
        case apiToken = "api_token"
        case appodealKey = "appodeal_key"
        case flightsEnabled = "flights_enabled"
        case hotelsEnabled = "hotels_enabled"
        case appLogo = "app_logo"
        case appNames = "app_name"
        case appDescriptions = "app_description"
        case feedbackEmail = "feedback_email"
        case itunesLink = "itunes_link"
        case externalLinks = "external_links"
        case colorParams = "color_params"
        case searchParams = "search_params"
        case defaultLocale = "default_locale"
        case firebaseEnabled = "firebase_enabled"
    }
}

struct ExternalLink: Codable {
    
    var url: String?
    var name: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}

struct ColorParams: Codable {
    
    var mainColor: String?
    var actionColor: String?
    var formTintColor: String?
    var formBackgroundColor: String?
    var formTextColor: String?
    
    private enum CodingKeys: String, CodingKey {
        case mainColor = "main_color"
        case actionColor = "action_color"
        case formTintColor = "form_tint_color"
        case formBackgroundColor = "form_background_color"
        case formTextColor = "form_text_color"
    }
}

struct SearchParams: Codable {
    
    var defaultCurrency: String?
    var flightsOrigin: String?
    var flightsDestination: String?
    var availableAirlines: [String]?
    var hotelsCity: SearchCity?
    
    private enum CodingKeys: String, CodingKey {
        case defaultCurrency = "default_currency"
        case flightsOrigin = "flights_origin"
        case flightsDestination = "flights_destination"
        case availableAirlines = "available_airlines"
        case hotelsCity = "hotels_city"
    }
}

struct SearchCity: Codable {
    
    var identifier: String?
    var selectable: Bool?
    var names: [String : String]?
    var headers: [String : String]?
    
    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case selectable = "selectable"
        case names = "names"
        case headers = "headers"
    }
}
