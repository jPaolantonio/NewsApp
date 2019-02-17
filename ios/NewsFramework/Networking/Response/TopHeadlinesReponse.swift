import Foundation

public struct TopHeadlinesResponse: Codable {
  let status: String
  let totalResults: Int
  let articles: [Article]
}
