import Foundation
import UIKit

final class LoadingCell: UITableViewCell {
  private lazy var loader = UIActivityIndicatorView(style: .gray)
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.addSubview(loader)
    loader.snp.makeConstraints { (make) in
      make.top.greaterThanOrEqualToSuperview().offset(15)
      make.center.equalToSuperview()
      make.bottom.lessThanOrEqualToSuperview().offset(15)
    }
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func startAnimating() {
    loader.startAnimating()
  }
}
