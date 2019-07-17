import Foundation
import SnapKit
import UIKit

final class ArticleDetailViewController: UIViewController {
  private let viewModel: ArticleDetailViewModel

  private lazy var descriptionTextView = UITextView()
  
  init(viewModel: ArticleDetailViewModel) {
    self.viewModel = viewModel
    
    super.init(nibName: nil, bundle: nil)
    
    title = viewModel.title
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.white

    descriptionTextView.text = viewModel.descriptionText
    descriptionTextView.font = UIFont.preferredFont(forTextStyle: .body)
    view.addSubview(descriptionTextView)
    descriptionTextView.snp.makeConstraints { (make: ConstraintMaker) in
      make.top.bottom.equalToSuperview().inset(CGFloat.na_grid(4))
      make.leading.greaterThanOrEqualToSuperview().inset(CGFloat.na_grid(4))
      make.trailing.lessThanOrEqualToSuperview().inset(CGFloat.na_grid(4))
      make.centerX.equalToSuperview()
      make.width.equalTo(540).priority(ConstraintPriority.high)
    }
  }
}
