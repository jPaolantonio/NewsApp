//: [Previous](@previous)

@testable import NewsFramework

import UIKit
import PlaygroundSupport
import SnapKit

NSSetUncaughtExceptionHandler { exception in
    print("💥 Exception thrown: \(exception)")
}

let viewController = TableViewController()

PlaygroundPage.current.liveView = viewController.view

let (parent, _) = playgroundControllers(device: .phone4inch, orientation: .portrait, child: viewController)

// Render the screen.
let frame = parent.view.frame
PlaygroundPage.current.liveView = parent
parent.view.frame = frame

enum Row {
    case article(data: ArticleCell.Data)
    case articleView(data: ArticleViewCell.Data)
    case error(data: ErrorCell.Data)
    case loading
}

final class TableViewController: UIViewController, UITableViewDataSource {
    let data: [Row] = [
        Row.article(data: .init(title: "Article Title")),
        Row.articleView(data: .init(title: "Article Title", likes: "3")),
        Row.error(data: .init(title: "Error")),
        Row.loading
    ]

    lazy var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make: ConstraintMaker) in
            make.edges.equalToSuperview()
        }

        tableView.register(cellClass: ArticleCell.self)
        tableView.register(cellClass: ArticleViewCell.self)
        tableView.register(cellClass: LoadingCell.self)
        tableView.register(cellClass: ErrorCell.self)
        tableView.tableFooterView = UIView()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch data[indexPath.row] {
        case let .article(data):
            let cell = tableView.dequeueReusableCell(cellClass: ArticleCell.self, for: indexPath)
            cell.update(data: data)
            return cell
        case let .articleView(data):
            let cell = tableView.dequeueReusableCell(cellClass: ArticleViewCell.self, for: indexPath)
            cell.update(data: data)
            return cell
        case let .error(data):
            let cell = tableView.dequeueReusableCell(cellClass: ErrorCell.self, for: indexPath)
            cell.update(data: data)
            return cell
        case .loading:
            let cell = tableView.dequeueReusableCell(cellClass: LoadingCell.self, for: indexPath)
            cell.startAnimating()
            return cell
        }
    }
}

//: [Next](@next)
