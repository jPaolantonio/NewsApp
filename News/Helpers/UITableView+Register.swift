import Foundation
import UIKit

extension UITableView {
  func register<T: UITableViewCell>(cellClass: T.Type) {
    register(cellClass, forCellReuseIdentifier: String(describing: cellClass))
  }

  func register<T: UITableViewCell>(cellClasses: [T.Type]) {
    cellClasses.forEach { register(cellClass: $0) }
  }

  func dequeueReusableCell<T: UITableViewCell>(cellClass: T.Type, for indexPath: IndexPath) -> T {
    return dequeueReusableCell(withIdentifier: String(describing: cellClass.self), for: indexPath) as! T
  }
}
