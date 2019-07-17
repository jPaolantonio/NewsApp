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
    Article(articleDescription:  "Suspendisse ornare felis ipsum, vitae viverra purus efficitur quis. Sed nibh lorem, interdum nec ultricies sit amet, condimentum non metus..",
            author: "Leonardo da Vinci",
            content: "",
            publishedAt: "",
            source: Article.Source.template,
            title: "Lorem Ipsum Dolor",
            url: "",
            urlToImage: "")
}
