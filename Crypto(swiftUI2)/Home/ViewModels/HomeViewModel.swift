//
//  HomeViewModel.swift
//  Crypto(swiftUI2)
//
//  Created by Drum, Jesse on 5/9/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private let dataService = CoinDataServices()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
     addSubscribers()
    }
    
    func addSubscribers(){
       
        // updates allCOin
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnCoins) in
                self?.allCoins = returnCoins
            }
            .store(in: &cancellables)
    }
        
        private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
            guard !text.isEmpty else {
                return coins
            }
            
            let lowercaseText = text.lowercased()
            
            return coins.filter { (coin) -> Bool in
                return coin.name.lowercased().contains(lowercaseText) ||
                    coin.symbol.lowercased().contains(lowercaseText) ||
                    coin.id.lowercased().contains(lowercaseText)
            }
        }
    
   
}
