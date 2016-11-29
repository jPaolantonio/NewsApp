import Foundation
import RxSwift
import UIKit

final class FlowCoordinator: FlowCoordinatorType {
  var coordinators: [FlowCoordinatorType] = []

  private let navigationController: UINavigationController
  private let disposeBag = DisposeBag()

  init(with navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let viewModel = ArticlesViewModel()
    let viewController = ArticlesViewController(viewModel: viewModel)
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
    let viewModel = ArticleViewModel(article: article)
    let viewController = ArticleViewController(viewModel: viewModel)
    navigationController.pushViewController(viewController, animated: true)
  }
}
