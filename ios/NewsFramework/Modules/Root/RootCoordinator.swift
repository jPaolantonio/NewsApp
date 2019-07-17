import Foundation
import RxSwift
import UIKit

public final class RootCoordinator: CoordinatorType {
  var coordinators: [CoordinatorType] = []

  private let navigationController: UINavigationController
  private let disposeBag = DisposeBag()

  private let services = Services()

  public init(with navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  public func start() {
    let viewModel = ArticleListViewModel(sourcesService: services.sources, viewCounter: services.viewCounter)
    let viewController = ArticleListViewController(viewModel: viewModel)
    viewController
      .actions
      .emit(onNext: { [unowned self] (action) in
        switch action {
        case let .viewArticle(article):
          self.showArticle(article)
        }
      })
      .disposed(by: disposeBag)

    viewController
      |> addSourcesButton(to:)

    navigationController.show(viewController, sender: self)
  }

  private func showArticle(_ article: Article) {
    let viewModel = ArticleDetailViewModel(article: article, viewCounter: services.viewCounter)
    let viewController = ArticleDetailViewController(viewModel: viewModel)

    navigationController.pushViewController(viewController, animated: true)
  }

  private func presentSources() {
    let viewModel = SourcesViewModel(sourcesService: services.sources)
    let viewController = SourcesViewController(viewModel: viewModel)
    let navigationController = UINavigationController(rootViewController: viewController)

    viewController
      .actions
      .emit(onNext: { (action) in
        switch action {
        case .save:
          navigationController.dismiss(animated: true, completion: nil)
        }
      })
      .disposed(by: disposeBag)

    viewController
      |> addCloseButton(to:)

    self.navigationController.present(navigationController, animated: true, completion: nil)
  }

  private func addSourcesButton(to viewController: UIViewController) {
    let backButton = UIBarButtonItem(title: "Sources", style: .plain, target: nil, action: nil)
    backButton
      .rx.tap
      .subscribe(onNext: { [unowned self] in
        self.presentSources()
      })
      .disposed(by: disposeBag)

    viewController.navigationItem.leftBarButtonItem = backButton
  }

  private func addCloseButton(to viewController: UIViewController) {
    let backButton = UIBarButtonItem(barButtonSystemItem: .stop, target: nil, action: nil)
    backButton
      .rx.tap
      .subscribe(onNext: { [unowned viewController] in
        viewController.dismiss(animated: true, completion: nil)
      })
      .disposed(by: disposeBag)

    viewController.navigationItem.leftBarButtonItem = backButton
  }
}
