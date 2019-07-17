import Foundation

public struct TopHeadlinesRequest: Codable {
  let country: String
  let sources: [Source]

  init(country: String = "us", sources: [Source] = []) {
    self.country = country
    self.sources = sources
  }

  var queryParameters: [String: AnyHashable] {
    if sources.isEmpty {
      return [ "country" : country ]
    } else {
      return [ "sources" : sources.map { $0.id }.joined(separator: ",") ]
    }
  }
}
