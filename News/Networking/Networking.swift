import Foundation
import Moya
import RxSwift

final class Networking {
  private let provider: MoyaProvider<NewsApi>

  init(endpointClosure: @escaping MoyaProvider<NewsApi>.EndpointClosure = MoyaProvider.defaultEndpointMapping,
       stubClosure: @escaping MoyaProvider<NewsApi>.StubClosure = MoyaProvider.neverStub,
       manager: Manager = MoyaProvider<NewsApi>.defaultAlamofireManager()) {
    let plugins: [PluginType] = [
      AccessTokenPlugin(tokenClosure: { Secrets.NewsApi.apiKey } )
//      ,NetworkLoggerPlugin(verbose: true),
//      ,NetworkLoggerPlugin(cURL: true)
    ]
    self.provider = MoyaProvider(endpointClosure:endpointClosure,
                                 stubClosure: stubClosure,
                                 manager: manager,
                                 plugins: plugins)
  }

  func request(_ target: NewsApi) -> Single<Response> {
    return provider.rx.request(target)
  }
}
