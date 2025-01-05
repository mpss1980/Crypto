//
//  HomeViewFactory.swift
//  Crypto
//
//  Created by Field on 05/01/25.
//
class HomeViewFactory {

    static func create() -> HomeView {
        return HomeView(
            viewModel: createViewModel()
        )
    }

    private static func createViewModel() -> HomeViewModel {
        return HomeViewModel(
            getCoinListUseCase: createUseCase()
        )
    }

    private static func createUseCase() -> GetCoinListUseCase {
        return GetCoinListUseCase(
            repository: createRepository()
        )
    }

    private static func createRepository() -> CoinRepository {
        return CoinRepository(
            api: createApi(), failureMapper: CryptoFailureMapper()
        )
    }

    private static func createApi() -> CoinGeckoApi {
        return CoinGeckoApi(
            httpClient: createHttpClient()
        )
    }

    private static func createHttpClient() -> URLSessionHttpClient {
        return URLSessionHttpClient(
            requestMaker: UrlSessionRequestMaker(),
            errorResolver: UrlSessionErrorResolver())
    }
}
