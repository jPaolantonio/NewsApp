import Foundation
import Moya

enum NewsApi {
  case topHeadlines(request: TopHeadlinesRequest)
  case sources
}

extension NewsApi: TargetType {
  var baseURL: URL {
    return URL(string: Secrets.NewsApi.endpoint)!
  }
  
  var path: String {
    switch self {
    case .topHeadlines:
      return "top-headlines"
    case .sources:
      return "sources"
    }
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var sampleData: Data {
    return "{}".data(using: .utf8)!
  }
  
  var task: Task {
    switch self {
    case let .topHeadlines(request):
      return Task.requestParameters(parameters: request.queryParameters,
                                    encoding: URLEncoding.default)
    case .sources:
      return Task.requestPlain
    }
  }
  
  var headers: [String : String]? {
    return nil
  }
}

extension NewsApi: AccessTokenAuthorizable {
  var authorizationType: AuthorizationType { return AuthorizationType.bearer }
}
