@testable import News
@testable import NewsFramework

import Alamofire
import Foundation
import Moya

extension Endpoint {
  class func makeStubbed<T: TargetType>(target: T, data: Data? = nil, statusCode: Int = 200) -> Endpoint {
    return Endpoint(url: URL(target: target).absoluteString,
                    sampleResponseClosure: { return .networkResponse(statusCode, data ?? target.sampleData) },
                    method: target.method,
                    task: target.task,
                    httpHeaderFields: target.headers)
  }

  class func makeError<T: TargetType>(target: T, error: Error) -> Endpoint {
    return Endpoint(url: URL(target: target).absoluteString,
                    sampleResponseClosure: { return EndpointSampleResponse.networkError(error as NSError) },
                    method: target.method,
                    task: target.task,
                    httpHeaderFields: target.headers)
  }
}

extension Networking {
  class func makeStubbed(data: Data? = nil, statusCode: Int = 200) -> Networking {
    let endpointClosure: (NewsApi) -> Endpoint = { target in
      return Endpoint.makeStubbed(target: target, data: data, statusCode: statusCode)
    }
    return Networking(endpointClosure: endpointClosure, stubClosure: MoyaProvider.immediatelyStub)
  }

  class func makeStubbed<E: Encodable>(responseObject response: E, statusCode: Int = 200) -> Networking {
    let data = try! JSONEncoder().encode(response)
    return makeStubbed(data: data, statusCode: statusCode)
  }

  class func makeStubbed(response: String, statusCode: Int = 200) -> Networking {
    let data = response.data(using: String.Encoding.utf8)!
    return makeStubbed(data: data, statusCode: statusCode)
  }

  class func makeEmptyArrayStubbed(statusCode: Int = 200) -> Networking {
    return makeStubbed(response: "[]")
  }

  class func makeEmptyObjectStubbed(statusCode: Int = 200) -> Networking {
    return makeStubbed(response: "{}")
  }

  class func makeErrorStubbed(error: Error) -> Networking {
    let endpointClosure: (NewsApi) -> Endpoint = { target in
      return Endpoint.makeError(target: target, error: error)
    }
    return Networking(endpointClosure: endpointClosure, stubClosure: MoyaProvider.immediatelyStub)
  }

  class func makeDelayedStubbed(_ seconds: TimeInterval = 20) -> Networking {
    return Networking(stubClosure: MoyaProvider.delayedStub(seconds))
  }
}
