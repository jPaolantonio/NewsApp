@testable import News
@testable import NewsFramework

extension Article.Source {
  static let template: Article.Source =
    Article.Source(
      id: "abc-news",
      name: "ABC News"
  )
}
extension Article {
  static let template: Article =
    Article(author: "Leonardo da Vinci",
            content: "",
            description:  "Suspendisse ornare felis ipsum, vitae viverra purus efficitur quis. Sed nibh lorem, interdum nec ultricies sit amet, condimentum non metus..",
            publishedAt: "",
            source: Article.Source.template,
            title: "Lorem Ipsum Dolor",
            url: "",
            urlToImage: "")
}
