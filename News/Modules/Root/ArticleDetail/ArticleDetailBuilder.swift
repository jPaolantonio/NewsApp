import Foundation

class ArticleDetailBuilder {
  func build(article: Article) -> ArticleDetailViewController {
    let presenter = ArticleDetailPresenter(article: article)
    return ArticleDetailViewController(presenter: presenter)
  }
}
