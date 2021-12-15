//
//  CoinLogo.swift
//  CMCap
//
//  Created by Naji Achkar on 14/12/21.
//

import SwiftUI

struct CoinLogo: View {
    
    var coin: Coin
    
    var body: some View {
        
        let imageExists: Bool = UIImage(named: coin.id) != nil
        
        if imageExists {
            Image(coin.id)
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
        } else {
            AsyncImage(url: URL(string: "\(coin.imageURL)")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
            }
        placeholder: {
               ProgressView()
            }
        }
    }
}

//struct CoinLogo_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinLogo()
//    }
//}
