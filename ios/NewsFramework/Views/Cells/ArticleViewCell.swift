import Foundation
import UIKit

public final class ArticleViewCell: UITableViewCell {
  public struct Data: Codable, Equatable {
    let title: String
    let likes: String
  }
  private lazy var titleLabel = UILabel()
  private lazy var viewLabel = UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    viewLabel
      |> UILabel.titleStyle
      <> UILabel.compressionFixed
    contentView.addSubview(viewLabel)
    viewLabel.snp.makeConstraints { (make) in
      make.top.greaterThanOrEqualToSuperview().offset(15)
      make.trailing.equalToSuperview().inset(15)
      make.bottom.lessThanOrEqualToSuperview().inset(15)
      make.centerY.equalToSuperview()
    }

    titleLabel
      |> UILabel.titleStyle
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
