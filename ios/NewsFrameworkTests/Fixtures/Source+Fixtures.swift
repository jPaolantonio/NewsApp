@testable import News
@testable import NewsFramework

import Foundation

extension Source {
  static let template: Source =
    Source(id: "abc-news",
           name: "ABC News",
           description: "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.",
           url: "https://abcnews.go.com",
           category: "general",
           language: "en",
           country: "us"
  )
}
