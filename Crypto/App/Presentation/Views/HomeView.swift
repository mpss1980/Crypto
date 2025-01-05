//
//  HomeView.swift
//  Crypto
//
//  Created by Field on 04/01/25.
//
import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel: HomeViewModel
    @State private var showPortfolio = false
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()

            VStack {
                homeHeader
                columnTitles

                if !showPortfolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                } else {
                    portfolioList
                        .transition(.move(edge: .trailing))
                }

                Spacer(minLength: 0)
            }
        }.onAppear {
            viewModel.onAppear()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeViewFactory.create()
                .navigationBarHidden(true)
        }
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(
                    width: UIScreen.main.bounds.width / 3.5,
                    alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }

    private var allCoinsList: some View {
        return buildList(coins: viewModel.coins, showHoldingColumn: false)
    }

    private var portfolioList: some View {
        return buildList(
            coins: viewModel.portfolioCoins, showHoldingColumn: true)
    }

    private func buildList(coins: [Coin], showHoldingColumn: Bool) -> some View
    {
        List {
            ForEach(coins) { coin in
                CoinRowView(coin: coin, showHoldingColumn: showHoldingColumn)
                    .listRowInsets(
                        .init(top: 10, leading: 0, bottom: 10, trailing: 10))
            }
        }
        .listStyle(PlainListStyle())
    }
}
