import Foundation
import Moya

public enum NewsApi {
  case topHeadlines(request: TopHeadlinesRequest)
  case sources
}

extension NewsApi: TargetType {
  public var baseURL: URL {
    return URL(string: Secrets.NewsApi.endpoint)!
  }
  
  public var path: String {
    switch self {
    case .topHeadlines:
      return "top-headlines"
    case .sources:
      return "sources"
    }
  }
  
  public var method: Moya.Method {
    return .get
  }
  
  public var sampleData: Data {
    return "{}".data(using: .utf8)!
  }
  
  public var task: Task {
    switch self {
    case let .topHeadlines(request):
      return Task.requestParameters(parameters: request.queryParameters,
                                    encoding: URLEncoding.default)
    case .sources:
      return Task.requestPlain
    }
  }
  
  public var headers: [String : String]? {
    return nil
  }
}

extension NewsApi: AccessTokenAuthorizable {
  public var authorizationType: AuthorizationType { return AuthorizationType.bearer }
}
