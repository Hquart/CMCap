//
//  ListView.swift
//  CMCap
//
//  Created by Naji Achkar on 07/12/21.
//

import SwiftUI
import Foundation

struct ListView: View {
    
    @ObservedObject var coinsService: CoinsService
    @State private var searchText: String = ""
    @State private var needsRefresh: Bool = false
    
    var searchResults: [Coin] {
          if searchText.isEmpty {
              return coinsService.coins
          } else {
              return coinsService.coins.filter {
                  $0.name.contains(searchText)
              }
          }
      }
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    var body: some View {
        NavigationView {
            ZStack {
                List(searchResults)  { coin in
                    CoinRow2(coin: coin)
                }
                .searchable(text: $searchText, prompt: "Search by name")
                .refreshable {
                    coinsService.updateCoinsInfo()
                    debugPrint("REFRESH")
                }
            }
            .environment(\.defaultMinListRowHeight, 85)
            .listStyle(.inset)
            .padding(.vertical)
            .navigationTitle("CryptoMarket" )
            
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(coinsService: CoinsService())
            .preferredColorScheme(.dark)
      
    }
}
