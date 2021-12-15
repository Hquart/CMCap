//
//  coinRow.swift
//  CMCap
//
//  Created by Naji Achkar on 07/12/21.
//

import SwiftUI

struct CoinRow2: View {
    
    let coin: Coin
    
    var body: some View {
        GeometryReader { geo in
            HStack(alignment: .bottom) {
                ///////////////////////////////// /IMAGE //////////////////////////////////////////////////////
                VStack(alignment: .center, spacing: 10) {
                    CoinLogo(coin: coin)
                    .frame(width: 35, height: 35)
                    Text("\(coin.symbol)")
                        .font(.caption)
                        .textCase(.uppercase)
                }
                .frame(width: geo.size.width*0.2, alignment: .leading)
                
                VStack(spacing: 8) {
                    
                    /////////////////////////////////// NAME + PRICE //////////////////////////////////////////////////////////////
                    HStack {
                        Text("\(coin.rank)")
                            .font(.caption2)
                            .foregroundColor(Color.black).bold()
                            .padding(3)
                            .background(Color.theme.lightGray)
                            .cornerRadius(3)
                        Text(coin.name)
                            .font(.body).bold().foregroundColor(Color.theme.mainText)
                        Spacer()
                        Text("\(coin.currentPrice, specifier: "%.2f") $")
                            .font(.body).bold().foregroundColor(Color.theme.mainText)
                    }
                    ///////////////////////////////////  CAP + ATH  //////////////////////////////////////////////////////////////
                    HStack {
                        Text("MCap: ")
                            .font(.caption2)
                            .foregroundColor(Color.gray)
                        Text("\(coin.formatedCap)")
                            .font(.footnote)
                            .foregroundColor(Color.theme.blue).bold()
                        Spacer()
                            .background(Color.theme.lightGray)
                            .cornerRadius(3)
                    }
                    ////////////////////////////////////////  RANK + 24H ////////////////////////////////////////
                    HStack {
                        Text ("ATH")
                            .font(.caption2)
                            .foregroundColor(Color.gray)
                        Text("\(coin.ath, specifier: "%.2f") $")
                            .font(.caption2)
                            .foregroundColor(Color.theme.mainText)
                        Spacer()

                        Text("24h:")
                            .font(.caption2)
                            .foregroundColor(Color.gray)
                        Text("\(coin.rate24h, specifier: "%.2f") %")
                            .font(.headline)
                            .foregroundColor(coin.rate24h >= 0 ? Color.green : Color.red)
                    }
                  
                    
                }
                
            }
        }
    }
}

//struct CoinRow_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//        Spacer(minLength: 350)
//            CoinRow(coin: Coin.bitcoin).previewLayout(.sizeThatFits)
//            CoinRow(coin: Coin.dogecoin).previewLayout(.sizeThatFits)
//        Spacer(minLength: 300)
//    }
//    }
//}

