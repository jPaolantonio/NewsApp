import Foundation

class ArticleDetailBuilder {
  func build(article: Article) -> ArticleDetailViewController {
    let interactor = ArticleDetailInteractor(article: article)
    return ArticleDetailViewController(interactor: interactor)
  }
}
