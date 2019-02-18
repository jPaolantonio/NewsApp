import Foundation
import UIKit

public final class ArticleCell: UITableViewCell {
  public struct Data: Codable, Hashable {
    let title: String
  }
  private lazy var titleLabel = UILabel()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    titleLabel
      |> UILabel.titleStyle

    contentView.addSubview(titleLabel)
    titleLabel.snp.makeConstraints { (make) in
      make.leading.top.equalToSuperview().offset(CGFloat.na_grid(4))
      make.trailing.lessThanOrEqualToSuperview().inset(CGFloat.na_grid(4))
      make.bottom.equalToSuperview().inset(CGFloat.na_grid(4))
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func update(data: Data) {
    titleLabel.text = data.title
  }
}
