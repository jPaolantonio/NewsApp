@testable import News

import Foundation

extension TopHeadlinesResponse {
  static let template: TopHeadlinesResponse =
    TopHeadlinesResponse(
      status: "ok",
      totalResults: 1,
      articles: [ Article.template ]
  )
}
