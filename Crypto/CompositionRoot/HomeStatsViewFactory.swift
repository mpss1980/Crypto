//
//  HomeStatsViewFactory.swift
//  Crypto
//
//  Created by Field on 05/01/25.
//
class HomeStatsViewFactory {

    static func create() -> HomeStatsView {
        return HomeStatsView(
            viewModel: createViewModel()
        )
    }

    private static func createViewModel() -> HomeStatsViewModel {
        return HomeStatsViewModel(
            getStatisticListUseCase: createUseCase()
        )
    }

    private static func createUseCase() -> GetStatisticListUseCase {
        return GetStatisticListUseCase(
//            repository: createRepository()
        )
    }

//    private static func createRepository() -> CoinRepository {
//        return CoinRepository(
//            api: createApi(), failureMapper: CryptoFailureMapper()
//        )
//    }
//
//    private static func createApi() -> CoinGeckoApi {
//        return CoinGeckoApi(
//            httpClient: createHttpClient()
//        )
//    }
//
//    private static func createHttpClient() -> URLSessionHttpClient {
//        return URLSessionHttpClient(
//            requestMaker: UrlSessionRequestMaker(),
//            errorResolver: UrlSessionErrorResolver())
//    }
}
