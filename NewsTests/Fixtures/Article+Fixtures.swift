@testable import News

import Foundation

extension Article.Source {
  static func sample() -> Article.Source {
    return Article.Source(id: "abc-news", name: "ABC News")
  }
}
extension Article {
  static func sample() -> Article {
    return Article(author: "Leonardo da Vinci",
                   title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                   description: "Suspendisse ornare felis ipsum, vitae viverra purus efficitur quis. Sed nibh lorem, interdum nec ultricies sit amet, condimentum non metus..",
                   source: Article.Source.sample())
  }
}
