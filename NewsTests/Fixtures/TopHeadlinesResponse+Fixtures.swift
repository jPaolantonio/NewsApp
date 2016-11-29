@testable import News

import Foundation

extension TopHeadlinesResponse {
  static func sample() -> TopHeadlinesResponse {
    return TopHeadlinesResponse(status: "ok",
                                totalResults: 1,
                                articles: [ Article.sample() ])
  }
}
