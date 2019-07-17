import Foundation

struct Article: Codable  {
  struct Source: Codable {
    let id: String?
    let name: String
  }

  let articleDescription: String?
  let author: String?
  let content: String?
  let publishedAt: String?
  let source: Source
  let title: String
  let url: String?
  let urlToImage: String?

  private enum CodingKeys: String, CodingKey {
    case articleDescription = "description"
    case author = "author"
    case content = "content"
    case publishedAt = "publishedAt"
    case source = "source"
    case title = "title"
    case url = "url"
    case urlToImage = "urlToImage"
  }
}

extension Article.Source: CustomStringConvertible {}
extension Article.Source: Hashable {}
extension Article: CustomStringConvertible {}
extension Article: Hashable {}
