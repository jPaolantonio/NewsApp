import Foundation

class ArticleListBuilder {
  func build() -> ArticleListViewController {
    let presenter = ArticleListPresenter()
    return ArticleListViewController(presenter: presenter)
  }
}
