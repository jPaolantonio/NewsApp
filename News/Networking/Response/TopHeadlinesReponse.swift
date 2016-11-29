import Foundation

struct TopHeadlinesResponse: Codable {
  let status: String
  let totalResults: Int
  let articles: [Article]
}
