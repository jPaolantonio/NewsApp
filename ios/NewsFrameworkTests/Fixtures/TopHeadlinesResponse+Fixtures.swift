@testable import News
@testable import NewsFramework

import Foundation

extension TopHeadlinesResponse {
  static let template: TopHeadlinesResponse =
    TopHeadlinesResponse(
      status: "ok",
      totalResults: 1,
      articles: [ Article.template ]
  )
}
