import Foundation

final class ArticleDetailViewModel: ViewModel {
  private let article: Article
  private let viewCounter: ViewCounterType
  let title: String
  let descriptionText: String?
  
  init(article: Article,
       viewCounter: ViewCounterType = ViewCounter()) {
    self.article = article
    self.descriptionText = article.articleDescription
    self.title = article.title
    self.viewCounter = viewCounter

    viewCounter.view(article: article)
  }
}
