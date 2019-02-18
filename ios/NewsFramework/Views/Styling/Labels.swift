import Foundation

extension UILabel {
  static let baseStyle = { (view: UILabel) in
    view.numberOfLines = 0
  }

  static let titleStyle = baseStyle
    <> { (view: UILabel) in view.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline) }

  static let detailStyle = baseStyle
    <> { (view: UILabel) in view.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.subheadline) }

  static let compressionFixed = baseStyle
    <> { (view: UILabel) in
      view.setContentCompressionResistancePriority(.required, for: .horizontal)
      view.setContentHuggingPriority(.required, for: .horizontal)
  }
}
