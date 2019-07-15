import Foundation

extension CGFloat {
  static func na_grid(_ n: Int) -> CGFloat {
    return CGFloat(n) * 4
  }
}

let generousMargins = { (view: UIView) in
  view.layoutMargins = .init(top: .na_grid(6), left: .na_grid(6), bottom: .na_grid(6), right: .na_grid(6))
}
