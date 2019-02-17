import Foundation

class ArticleListBuilder {
  func build() -> ArticleListViewController {
    let interactor = ArticleListInteractor()
    return ArticleListViewController(interactor: interactor)
  }
}
