//
//  FlightsBuyEvent.swift
//  AviasalesSDKTemplate
//
//  Created by Dim on 03.09.2018.
//  Copyright © 2018 Go Travel Un Limited. All rights reserved.
//

class FlightsBuyEvent: NSObject, AnalyticsEvent {

    let name: String = "Flights_Buy"
    let payload: [String : String]

    @objc init(proposal: JRSDKProposal) {
        let formatter = DateFormatter(format: "yyyy-MM-dd HH:mm")
        var payload = [String: String]()
        payload["Type"] = proposal.ticket?.searchResultInfo.searchInfo.typeRepresentation()
        payload["Price"] = String(proposal.price.priceInUSD().floatValue)
        payload["Agency"] = proposal.gate.label
        if let ticket = proposal.ticket {
            payload["Airlines"] = airlines(from: ticket)
            NSOrderedSetSequence<JRSDKFlightSegment>(orderedSet: ticket.flightSegments).enumerated().forEach { (index, element) in
                payload["Departure_Airport_\(index)"] = JRSDKModelUtils.flightSegmentOriginIATA(element)
                payload["Arrival_Airport_\(index)"] = JRSDKModelUtils.flightSegmentDestinationIATA(element)
                payload["Departure_Date_\(index)"] = element.departureDateTimestamp.formattedTimestampRepresentation(formatter: formatter)
                payload["Arrival_Date_\(index)"] = element.arrivalDateTimestamp.formattedTimestampRepresentation(formatter: formatter)
                payload["Direct_\(index)"] = JRSDKModelUtils.isDirectFlightSegment(element) ? "true" : "false"
            }
        }
        self.payload = payload
        super.init()
    }
}

private func airlines(from ticket: JRSDKTicket) -> String {
    let airlines = NSOrderedSetSequence<JRSDKFlightSegment>(orderedSet: ticket.flightSegments).flatMap { (segment) in
        return NSOrderedSetSequence<JRSDKFlight>(orderedSet: segment.flights).map { (flight) in
            return flight.airline.iata
        }
    }
    return Set(airlines).joined(separator: ", ")
}
