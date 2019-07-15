import Foundation
import RxCocoa
import RxDataSources
import RxSwift
import SnapKit
import UIKit

final class ArticleListViewController: UIViewController {
  enum RoutingAction {
    case viewArticle(Article)
  }
  private let _actions = PublishRelay<RoutingAction>()
  var actions: Signal<RoutingAction> { return _actions.asSignal() }
  
  private let viewModel: ArticleListViewModel
  private let disposeBag = DisposeBag()
  
  private lazy var tableView = UITableView()
  
  init(viewModel: ArticleListViewModel) {
    self.viewModel = viewModel
    
    super.init(nibName: nil, bundle: nil)
    
    title = LocalizedString("News")
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .white
    
    tableView.backgroundColor = view.backgroundColor
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 50
    tableView.contentInset = UIEdgeInsets(top: 7.5, left: 0, bottom: 7.5, right: 0)
    tableView.register(ArticleCell.self, ArticleViewCell.self, ErrorCell.self, LoadingCell.self)
    view.addSubview(tableView)
    tableView.snp.makeConstraints { (make: ConstraintMaker) in
      make.top.bottom.equalToSuperview()
      make.leading.greaterThanOrEqualToSuperview()
      make.trailing.lessThanOrEqualToSuperview()
      make.centerX.equalToSuperview()
      make.width.equalTo(540).priority(ConstraintPriority.high)
    }
    
    setupTableViewDataSource()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    viewModel.start()
  }
  
  private func setupTableViewDataSource() {
    let animationConfiguration: AnimationConfiguration = AnimationConfiguration(insertAnimation: .fade, reloadAnimation: .fade, deleteAnimation: .fade)
    let configureCell: TableViewSectionedDataSource<ArticleListSection>.ConfigureCell = { (_, tableView: UITableView, indexPath: IndexPath, item: ArticleListRow) in
      switch item {
      case .loading:
        let cell = tableView.dequeueReusableCell(cellClass: LoadingCell.self, for: indexPath)
        cell.startAnimating()
        return cell
      case let .article(_, data):
        let cell = tableView.dequeueReusableCell(cellClass: ArticleCell.self, for: indexPath)
        cell.update(data: data)
        return cell
      }
    }
    let dataSource = RxTableViewSectionedAnimatedDataSource<ArticleListSection>(animationConfiguration: animationConfiguration,
                                                                                configureCell: configureCell)
    tableView
      .rx.itemSelected
      .subscribe(onNext: { [unowned self] (indexPath: IndexPath) in self.selected(dataSource: dataSource, indexPath: indexPath) })
      .disposed(by: disposeBag)
    
    viewModel
      .sections
      .asObservable()
      .bind(to: tableView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
  }
  
  private func selected(dataSource: TableViewSectionedDataSource<ArticleListSection>, indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    switch dataSource[indexPath] {
    case .loading: break
    case let .article(article, _): _actions.accept(RoutingAction.viewArticle(article))
    }
  }
}
