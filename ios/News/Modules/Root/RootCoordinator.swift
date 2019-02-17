import Foundation
import RxSwift
import UIKit

final class RootCoordinator: CoordinatorType {
  var coordinators: [CoordinatorType] = []

  private let navigationController: UINavigationController
  private let disposeBag = DisposeBag()

  init(with navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let articleListBuilder = ArticleListBuilder()
    let viewController = articleListBuilder.build()
    navigationController.show(viewController, sender: self)
    viewController
      .actions
      .subscribe(onNext: { [unowned self] (action) in
        switch action {
        case let .viewArticle(article):
          self.showArticle(article)
        }
      })
      .disposed(by: disposeBag)
  }

  private func showArticle(_ article: Article) {
    let articleDetailBuilder = ArticleDetailBuilder()
    let viewController = articleDetailBuilder.build(article: article)
    navigationController.pushViewController(viewController, animated: true)
  }
}
