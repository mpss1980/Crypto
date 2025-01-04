//
//  CoinRowView.swift
//  Crypto
//
//  Created by Field on 04/01/25.
//
import SwiftUI

struct CoinRowView: View {

    let coin: Coin
    let showHoldingColumn: Bool

    var body: some View {
        HStack {
            leftColumn
            Spacer()
            if showHoldingColumn {
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(
            coin: dev.coin,
            showHoldingColumn: true
        )
    }
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }

    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(
                coin.currentHoldingsValue.asCurrencyWithDecimals(
                    maximumFractionDigits: 2
                )
            )
            .bold()
            Text(coin.currentHoldings.asNumberString())
        }
        .foregroundColor(Color.theme.accent)
    }

    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(
                coin.currentPrice.asCurrencyWithDecimals(
                    maximumFractionDigits: nil
                )
            )
            .bold()
            .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H.asPercentageString())
                .foregroundColor(
                    coin.priceChangePercentage24H >= 0
                        ? Color.theme.green : Color.theme.red)

        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
