import Foundation

struct Source: Codable {
  let id: String
  let name: String
  let description: String
  let url: String
  let category: String
  let language: String
  let country: String
}

extension Source: CustomStringConvertible {}
extension Source: Equatable {}
