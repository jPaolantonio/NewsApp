import Foundation
import UIKit

final class ErrorCell: UITableViewCell {
  struct Data: Codable, Hashable {
    let title: String
  }
  private lazy var titleLabel = UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    titleLabel.textColor = UIColor.red
    titleLabel.font = UIFont.systemFont(ofSize: 24)
    titleLabel.numberOfLines = 0
    contentView.addSubview(titleLabel)
    titleLabel.snp.makeConstraints { (make) in
      make.leading.top.equalToSuperview().offset(15)
      make.trailing.lessThanOrEqualToSuperview().inset(15)
      make.bottom.equalToSuperview().inset(15)
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func update(data: Data) {
    titleLabel.text = data.title
  }
}
