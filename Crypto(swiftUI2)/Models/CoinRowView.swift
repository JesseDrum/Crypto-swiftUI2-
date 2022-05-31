//
//  CoinRowView.swift
//  Crypto(swiftUI2)
//
//  Created by Drum, Jesse on 5/6/22.
//

import SwiftUI

struct CoinRowView: View {
  
    let coin: CoinModel
    let showHoldingColum: Bool
    
    
    var body: some View {
        HStack(spacing: 0){
           leftColum
            Spacer()
            if showHoldingColum{
                centerColum
            }
           rightColum
        }
        .font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: dev.coin, showHoldingColum: true)
                .previewLayout(.sizeThatFits)
            
            CoinRowView(coin: dev.coin, showHoldingColum: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
       
    }
}



extension CoinRowView {
    
    private var leftColum: some View{
        HStack{
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    private var centerColum: some View{
            VStack(alignment: .trailing) {
                Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                    .bold()
                Text((coin.currentHoldings ?? 0).asNumString())
            }
            .foregroundColor(Color.theme.accent)
        
    }
    
    private var rightColum: some View{
        VStack(alignment: .trailing){
            Text("\(coin.currentPrice.asCurrencyWith6Decimals())")
                .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.asPrecentString() ?? "")
                .foregroundColor(
                (coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green :
                    Color.theme.red
            )
                
        }
        .frame(width: UIScreen.main.bounds.width/3.5, alignment: .trailing)

    }
    
}
