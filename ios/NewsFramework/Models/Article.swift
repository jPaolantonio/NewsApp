import Foundation

public struct Article: Codable, Hashable {
  public struct Source: Codable, Hashable {
    let id: String?
    let name: String
  }

  let author: String?
  let content: String?
  let description: String?
  let publishedAt: String?
  let source: Source
  let title: String
  let url: String?
  let urlToImage: String?
}
