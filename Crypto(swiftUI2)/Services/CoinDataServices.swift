//
//  CoinDataServices.swift
//  Crypto(swiftUI2)
//
//  Created by Drum, Jesse on 5/10/22.
//

import Foundation
import Combine

class CoinDataServices {
    
    @Published var allCoins: [CoinModel] = []
    var coinSubscription: AnyCancellable?
    
    
    init() {
        getCoin()
        
    }
    
    private func getCoin()
    {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h")
                else { return }
    
    
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion(completion:), receiveValue: { [weak self] (returnCoins) in
                self?.allCoins = returnCoins
                self?.coinSubscription?.cancel()
            })
         
            
        
    }
    
    
}
