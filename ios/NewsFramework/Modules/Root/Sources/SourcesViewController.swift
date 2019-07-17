import Foundation
import RxCocoa
import RxDataSources
import RxSwift
import SnapKit
import UIKit

final class SourcesViewController: UIViewController {
  enum RoutingAction {
    case save
  }
  private let _actions = PublishRelay<RoutingAction>()
  var actions: Signal<RoutingAction> { return _actions.asSignal() }

  private let viewModel: SourcesViewModel
  private let disposeBag = DisposeBag()

  private lazy var tableView = UITableView()

  init(viewModel: SourcesViewModel) {
    self.viewModel = viewModel

    super.init(nibName: nil, bundle: nil)

    title = LocalizedString("Sources")

    let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: nil, action: nil)
    saveButton
      .rx.tap
      .subscribe(onNext: { [unowned self] in
        self.viewModel.saveFilteredSources()
        self._actions.accept(.save)
      })
      .disposed(by: disposeBag)
    navigationItem.rightBarButtonItem = saveButton
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white

    tableView.backgroundColor = view.backgroundColor
    tableView.separatorStyle = .none
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 50
    tableView.contentInset = UIEdgeInsets(top: 7.5, left: 0, bottom: 7.5, right: 0)
    tableView.register(SourceCell.self, ErrorCell.self, LoadingCell.self)
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
    let configureCell: TableViewSectionedDataSource<SourcesListSection>.ConfigureCell = { (_, tableView: UITableView, indexPath: IndexPath, item: SourcesRow) in
      switch item {
      case .loading:
        let cell = tableView.dequeueReusableCell(cellClass: LoadingCell.self, for: indexPath)
        cell.startAnimating()
        return cell
      case let .source(_, data):
        let cell = tableView.dequeueReusableCell(cellClass: SourceCell.self, for: indexPath)
        cell.update(data: data)
        return cell
      case let .selectedSource(_, data):
        let cell = tableView.dequeueReusableCell(cellClass: SourceCell.self, for: indexPath)
        cell.update(data: data)
        return cell
      }
    }
    let dataSource = RxTableViewSectionedAnimatedDataSource<SourcesListSection>(animationConfiguration: animationConfiguration,
                                                                                configureCell: configureCell)
    tableView
      .rx.itemSelected
      .subscribe(onNext: { [unowned self] (indexPath: IndexPath) in self.selected(dataSource: dataSource, indexPath: indexPath) })
      .disposed(by: disposeBag)

    viewModel
      .viewState
      .map { $0.sections }
      .asObservable()
      .bind(to: tableView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
  }

  private func selected(dataSource: TableViewSectionedDataSource<SourcesListSection>, indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)

    switch dataSource[indexPath] {
    case .loading:
      break
    case let .source(source, _):
      viewModel.selectSource(source)
    case let .selectedSource(source, _):
      viewModel.selectSource(source)
    }
  }
}
