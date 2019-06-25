//
//  HotelsSearchEvent.swift
//  AviasalesSDKTemplate
//
//  Created by Dim on 06.09.2018.
//  Copyright © 2018 Go Travel Un Limited. All rights reserved.
//

class HotelsSearchEvent: NSObject, AnalyticsEvent {

    let name: String = "Hotels_Search"
    let payload: [String : String]

    @objc init(searchInfo: HLSearchInfo) {
        var payload = [String: String]()
        payload["Search_Type"] = searchInfo.searchInfoType.description()
        payload["Search_Date"] = DateFormatter(format: "yyyy-MM-dd").string(from: Date())
        payload["Search_City_ID"] = searchInfo.cityByCurrentSearchType?.cityId
        payload["Search_City_Name"] = searchInfo.cityByCurrentSearchType?.latinName
        payload["Search_Hotel_ID"] = searchInfo.hotel?.hotelId
        payload["Search_Depth"] = String(DateUtil.hl_daysBetweenDate(Date(), andOtherDate: searchInfo.checkInDate))
        payload["Search_Length"] = String(searchInfo.durationInDays)
        payload["Search_Adults"] = String(searchInfo.adultsCount)
        payload["Search_Kids"] = String(searchInfo.kidsCount)
        payload["Search_Сurrency"] = searchInfo.currency.code
        self.payload = payload
    }
}
