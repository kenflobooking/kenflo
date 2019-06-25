//
//  FlightsSearchEvent.swift
//  AviasalesSDKTemplate
//
//  Created by Dim on 08.08.2018.
//  Copyright © 2018 Go Travel Un Limited. All rights reserved.
//

class FlightsSearchEvent: AnalyticsEvent {

    enum Result {
        case succeed
        case cancelled
        case failed(Int)
    }

    let name: String = "Flights_Search"
    let payload: [String : String]

    init(searchInfo: JRSDKSearchInfo, result: Result) {
        let formatter = DateFormatter(format: "yyyy-MM-dd")
        var payload = [String: String]()
        payload["Type"] = searchInfo.typeRepresentation()
        NSOrderedSetSequence<JRSDKTravelSegment>(orderedSet: searchInfo.travelSegments).enumerated().forEach { (index, element) in
            payload["Departure_City_\(index)"] = element.originAirport.iata
            payload["Arrival_City_\(index)"] = element.destinationAirport.iata
            payload["Departure_Date_\(index)"] = formatter.string(from: element.departureDate)
        }
        payload["Adults"] = String(searchInfo.adults)
        payload["Children"] = String(searchInfo.children)
        payload["Infants"] = String(searchInfo.infants)
        payload["Class"] = travelClass(for: searchInfo)
        payload["Result"] = representation(for: result)
        if case let .failed(code) = result {
            payload["Error"] = String(code)
        }
        self.payload = payload
    }
}

private func travelClass(for searchInfo: JRSDKSearchInfo) -> String {
    switch searchInfo.travelClass {
    case .economy:
        return "Economy"
    case .business:
        return "Business"
    case .premiumEconomy:
        return "Premium Economy"
    case .first:
        return "First"
    }
}

private func representation(for result: FlightsSearchEvent.Result) -> String {
    switch result {
    case .succeed:
        return "Succeed"
    case .cancelled:
        return "Cancelled"
    case .failed:
        return "Failed"
    }
}
