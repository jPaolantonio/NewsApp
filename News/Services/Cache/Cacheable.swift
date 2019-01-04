import Foundation

protocol Cacheable {
  func encode() -> String?
  static func decode(data: String?) -> Any?
}
