import Foundation
import UIKit

extension UITableView {
  public func register(_ cellClasses: UITableViewCell.Type...) {
    cellClasses.forEach { register($0, forCellReuseIdentifier: String(describing: $0)) }
  }

  public func dequeueReusableCell<T: UITableViewCell>(cellClass: T.Type, for indexPath: IndexPath) -> T {
    return dequeueReusableCell(withIdentifier: String(describing: cellClass.self), for: indexPath) as! T
  }
}
