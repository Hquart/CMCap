//
//  Coin.swift
//  CMCap
//
//  Created by Naji Achkar on 07/12/21.
//

import Foundation
import SwiftUI


struct Coin: Identifiable, Codable  {
    
    var id: String
    var symbol: String
    var name: String
    var imageURL: String
    var rank: Int
    var rate24h: Double
    var currentPrice: Double
    var ath: Double
    var cap: Double
    var capRate24h: Double
    
    var formatedCap: String {
        return formatNumber(n: Int(cap))
    }
    var formatedPrice: String {
        return formatNumber(n: Int(currentPrice))
    }
    
    var wayToATH: Double {
        return currentPrice/ath * 100
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case symbol = "symbol"
        case name = "name"
        case imageURL = "image"
        case rank = "market_cap_rank"
        case rate24h = "price_change_percentage_24h"
        case currentPrice = "current_price"
        case ath = "ath"
        case cap =  "market_cap"
        case capRate24h =  "market_cap_change_percentage_24h"
        
    }
    
    func formatNumber(n: Int) -> String {
        let num = abs(Double(n))
        let sign = (n < 0) ? "-" : ""

        switch num {
        case 1_000_000_000...:
            var formatted = num / 1_000_000_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted) B"

        case 1_000_000...:
            var formatted = num / 1_000_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)M"

        case 1_000...:
            var formatted = num / 1_000
            formatted = formatted.reduceScale(to: 1)
            return "\(sign)\(formatted)K"

        case 0...:
            return "\(n)"

        default:
            return "\(sign)\(n)"
        }
    }
    
//    static var bitcoin = Coin(id: "1", symbol: "BTC", name: "Bitcoin", image: "bitcoin", rank: 1, rate24h: 2.28, currentPrice: 51298.25, ath: 69420.87, cap: 872687268726.23)
//    static var dogecoin = Coin(id: "15", symbol: "DOGE", name: "Dogecoin", image: "dogecoin", rank: 15, rate24h: 1.87, currentPrice: 1.27, ath: 2.65, cap: 2268726.23)
    
}

    
    

    
    
    
    
    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////








// MARK: - WelcomeElement
//struct WelcomeElement: Codable {
//    let id, symbol, name: String
//    let image: String
//    let currentPrice: Double
//    let marketCap, marketCapRank: Int
//    let fullyDilutedValuation: Int?
//    let totalVolume: Int
//    let high24H, low24H, priceChange24H, priceChangePercentage24H: Double
//    let marketCapChange24H, marketCapChangePercentage24H, circulatingSupply: Double
//    let totalSupply, maxSupply: Int?
//    let ath, athChangePercentage: Double
//    let athDate: String
//    let atl, atlChangePercentage: Double
//    let atlDate: String
//    let roi: Roi?
//    let lastUpdated: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, symbol, name, image
//        case currentPrice = "current_price"
//        case marketCap = "market_cap"
//        case marketCapRank = "market_cap_rank"
//        case fullyDilutedValuation = "fully_diluted_valuation"
//        case totalVolume = "total_volume"
//        case high24H = "high_24h"
//        case low24H = "low_24h"
//        case priceChange24H = "price_change_24h"
//        case priceChangePercentage24H = "price_change_percentage_24h"
//        case marketCapChange24H = "market_cap_change_24h"
//        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
//        case circulatingSupply = "circulating_supply"
//        case totalSupply = "total_supply"
//        case maxSupply = "max_supply"
//        case ath
//        case athChangePercentage = "ath_change_percentage"
//        case athDate = "ath_date"
//        case atl
//        case atlChangePercentage = "atl_change_percentage"
//        case atlDate = "atl_date"
//        case roi
//        case lastUpdated = "last_updated"
//    }
//}
//
//// MARK: - Roi
//struct Roi: Codable {
//    let times: Double
//    let currency: String
//    let percentage: Double
//}
//
//typealias Welcome = [WelcomeElement]
