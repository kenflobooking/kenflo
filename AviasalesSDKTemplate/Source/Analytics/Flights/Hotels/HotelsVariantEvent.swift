//
//  HotelsVariantEvent.swift
//  AviasalesSDKTemplate
//
//  Created by Dim on 07.09.2018.
//  Copyright © 2018 Go Travel Un Limited. All rights reserved.
//

class HotelsVariantEvent: AnalyticsEvent {

    let name: String = "Hotels_Variant"
    let payload: [String : String]

    init(variant: HLResultVariant) {
        var payload = [String: String]()
        let formatter = DateFormatter(format: "yyyy-MM-dd")
        payload["Hotel_Search_Type"] = variant.searchInfo.searchInfoType.description()
        payload["Hotel_ID"] = variant.hotel.hotelId
        payload["Hotel_Name"] = variant.hotel.latinName
        payload["Hotel_City_ID"] = variant.hotel.city?.cityId
        payload["Hotel_City_Name"] = variant.hotel.city?.latinName
        payload["Hotel_Country_ID"] = variant.hotel.city?.countryCode
        payload["Hotel_Country_Name"] = variant.hotel.city?.countryLatinName
        payload["Hotel_Check_In"] = format(variant.searchInfo.checkInDate, with: formatter)
        payload["Hotel_Check_Out"] = format(variant.searchInfo.checkOutDate, with: formatter)
        payload["Hotel_Adults_Count"] = String(variant.searchInfo.adultsCount)
        payload["Hotel_Kids_Count"] = String(variant.searchInfo.kidsCount)
        self.payload = payload
    }
}

private func format(_ date: Date?, with formatter: DateFormatter) -> String {
    guard let date = date else {
        return ""
    }
    return formatter.string(from: date)
}
