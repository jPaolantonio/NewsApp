import Foundation

struct TopHeadlinesRequest: Codable {
  let country: String = "us"

  var queryParameters: [String: Any] {
    guard let data = try? JSONEncoder().encode(self) else { return [:] }
    guard let object = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return [:] }
    return object ?? [:]
  }
}
