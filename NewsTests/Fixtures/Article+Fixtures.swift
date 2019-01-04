@testable import News

import Foundation

extension Article.Source {
  static let template: Article.Source =
    Article.Source(
      id: "abc-news",
      name: "ABC News"
  )
}
extension Article {
  static let template: Article =
    Article(
      author: "Leonardo da Vinci",
      title: "Lorem Ipsum Dolor",
      description: "Suspendisse ornare felis ipsum, vitae viverra purus efficitur quis. Sed nibh lorem, interdum nec ultricies sit amet, condimentum non metus..",
      source: Article.Source.template
  )
}
