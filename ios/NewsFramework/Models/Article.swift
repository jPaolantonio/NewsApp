import Foundation

public  struct Article: Codable, Hashable {
  public  struct Source: Codable, Hashable {
    let id: String?
    let name: String
  }

  let author: String?
  let title: String
  let description: String?
  let source: Source
}
