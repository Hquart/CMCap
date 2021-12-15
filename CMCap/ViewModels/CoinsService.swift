//
//  CoinModel.swift
//  CMCap
//
//  Created by Naji Achkar on 08/12/21.
//

import Foundation
import Combine
import SwiftUI

class CoinsService: ObservableObject {
    
    @Published var coins = [Coin]()
    
    // Preview purpose
//    @Published var coins: [Coin] = Bundle.main.decode("CoinsData.json")
    
    
    private var cancellable: AnyCancellable?
    private var baseURL = "https://api.coingecko.com/api/v3/coins/markets"
    
    private var parameters: [String: String] =
    [ "vs_currency" : "usd",
      "order": "market_cap_desc"]
    
    init() {
        updateCoinsInfo()
    }
    

    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func getCoinsData(baseURL: String, parameters: [String: String]) -> AnyPublisher<[Coin], Error> {
        guard var components = URLComponents(string: baseURL) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher() }
        components.setQueryItems(with: parameters)
        guard let url = components.url else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher() }
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func updateCoinsInfo() {
        
        cancellable = getCoinsData(baseURL: baseURL, parameters: parameters)
            .receive(on: DispatchQueue.main)
            .catch { _ in Just(self.coins)}
            .sink(receiveValue: { data in
                self.coins = data
            })
        
    }
    
    
    
    
}
