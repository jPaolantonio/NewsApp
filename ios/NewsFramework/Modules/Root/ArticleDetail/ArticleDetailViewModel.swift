import Foundation

final class ArticleDetailViewModel: ViewModel {
  private let article: Article
  let title: String
  let descriptionText: String?
  
  init(article: Article) {
    self.article = article
    self.title = article.title
    self.descriptionText = article.articleDescription
  }
}
