import Foundation

final class ArticleDetailInteractor: Interactor {
  private let article: Article
  let title: String
  let descriptionText: String?
  
  init(article: Article) {
    self.article = article
    self.title = article.title
    self.descriptionText = article.description
  }
}
