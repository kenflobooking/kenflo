//
//  FlightsTicketEvent.swift
//  AviasalesSDKTemplate
//
//  Created by Dim on 10.08.2018.
//  Copyright © 2018 Go Travel Un Limited. All rights reserved.
//

class FlightsTicketEvent: NSObject, AnalyticsEvent {

    let name: String = "Flights_Ticket"
    let payload: [String : String]

    @objc init(ticket: JRSDKTicket) {
        let formatter = DateFormatter(format: "yyyy-MM-dd HH:mm")
        var payload = [String: String]()
        payload["Type"] = ticket.searchResultInfo.searchInfo.typeRepresentation()
        payload["Airline"] = ticket.mainAirline.iata
        payload["Price"] = minPrice(for: ticket)
        payload["Airports"] = airports(for: ticket)
        NSOrderedSetSequence<JRSDKFlightSegment>(orderedSet: ticket.flightSegments).enumerated().forEach { (index, element) in
            payload["Departure_Airport_\(index)"] = JRSDKModelUtils.flightSegmentOriginIATA(element)
            payload["Arrival_Airport_\(index)"] = JRSDKModelUtils.flightSegmentDestinationIATA(element)
            payload["Departure_Date_\(index)"] = element.departureDateTimestamp.formattedTimestampRepresentation(formatter: formatter)
            payload["Arrival_Date_\(index)"] = element.arrivalDateTimestamp.formattedTimestampRepresentation(formatter: formatter)
            payload["Flight_Duration_\(index)"] = String(element.totalDurationInMinutes)
            payload["Num_Connections_\(index)"] = String(JRSDKModelUtils.flightSegmentStopoverCount(element))
        }
        self.payload = payload
        super.init()
    }
}

private func minPrice(for ticket: JRSDKTicket) -> String {
    if let price = JRSDKModelUtils.ticketMinimalPriceProposal(ticket)?.price {
        return String(price.priceInUSD().floatValue)
    } else {
        return ""
    }
}

private func airports(for ticket: JRSDKTicket) -> String {
    return NSOrderedSetSequence<JRSDKFlightSegment>(orderedSet: ticket.flightSegments).flatMap { (segment) in
        return NSOrderedSetSequence<JRSDKFlight>(orderedSet: segment.flights).map { (flight) in
            return "\(flight.originAirport.iata)-\(flight.destinationAirport.iata)"
        }
    }.joined(separator:", ")
}
