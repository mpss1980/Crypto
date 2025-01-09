//
//  HomeStatsView.swift
//  Crypto
//
//  Created by Field on 08/01/25.
//
import SwiftUI

struct HomeStatsView: View {
    @ObservedObject private var viewModel: HomeStatsViewModel
    
    init(viewModel: HomeStatsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            ForEach(viewModel.statistics) { stat in
                StatisticsView(stat: stat)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .trailing)
        .onAppear {
            viewModel.onAppear()
        }
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsViewFactory.create()
    }
}
