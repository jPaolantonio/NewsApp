import Foundation

public struct Source: Codable, Hashable {
  let id: String
  let name: String
  let description: String
  let url: String
  let category: String
  let language: String
  let country: String
}
