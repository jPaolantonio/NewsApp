import Foundation
import UIKit

final class ArticleViewCell: UITableViewCell {
  struct Data: Codable, Hashable {
    let title: String
    let likes: String
  }
  private lazy var titleLabel = UILabel()
  private lazy var viewLabel = UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    viewLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
    viewLabel.setContentHuggingPriority(.required, for: .horizontal)
    viewLabel.font = UIFont.boldSystemFont(ofSize: 14)
    viewLabel.numberOfLines = 1
    contentView.addSubview(viewLabel)
    viewLabel.snp.makeConstraints { (make) in
      make.top.greaterThanOrEqualToSuperview().offset(15)
      make.trailing.equalToSuperview().inset(15)
      make.bottom.lessThanOrEqualToSuperview().inset(15)
      make.centerY.equalToSuperview()
    }

    titleLabel.font = UIFont.systemFont(ofSize: 12)
    titleLabel.numberOfLines = 0
    contentView.addSubview(titleLabel)
    titleLabel.snp.makeConstraints { (make) in
      make.top.greaterThanOrEqualToSuperview().offset(15)
      make.leading.equalToSuperview().offset(15)
      make.trailing.lessThanOrEqualTo(viewLabel.snp.leading).inset(-15)
      make.bottom.lessThanOrEqualToSuperview().inset(15)
      make.centerY.equalToSuperview()
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func update(data: Data) {
    titleLabel.text = data.title
    viewLabel.text = data.likes
  }
}
