import Foundation

final class ArticleViewModel: ViewModel {
  private let article: Article
  let title: String

  init(article: Article) {
    self.article = article
    self.title = article.title
  }
}
