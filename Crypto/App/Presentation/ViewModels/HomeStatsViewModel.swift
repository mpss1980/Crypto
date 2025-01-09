//
//  HomeStatsViewModel.swift
//  Crypto
//
//  Created by Field on 08/01/25.
//
import Foundation

class HomeStatsViewModel: ObservableObject {
    let getStatisticListUseCase: GetStatisticListUseCaseType
    @Published var statistics: [Statistics] = []
    @Published var isLoading: Bool = false
    
    init(getStatisticListUseCase: GetStatisticListUseCaseType) {
        self.getStatisticListUseCase = getStatisticListUseCase
    }
    
    func onAppear() {
        Task {
            let result = await getStatisticListUseCase.execute()
            
            guard case .success(let statistics) = result else { return }
            
            Task { @MainActor in
                self.statistics = statistics
            }
        }
    }
}
