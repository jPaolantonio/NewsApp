import Foundation
import SnapKit
import UIKit

final class ArticleDetailViewController: UIViewController {
  private let interactor: ArticleDetailInteractor

  private lazy var descriptionTextView = UITextView()
  
  init(interactor: ArticleDetailInteractor) {
    self.interactor = interactor
    
    super.init(nibName: nil, bundle: nil)
    
    title = interactor.title
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.white

    descriptionTextView.text = interactor.descriptionText
    view.addSubview(descriptionTextView)
    descriptionTextView.snp.makeConstraints { (make: ConstraintMaker) in
      make.top.bottom.equalToSuperview()
      make.leading.greaterThanOrEqualToSuperview()
      make.trailing.lessThanOrEqualToSuperview()
      make.centerX.equalToSuperview()
      make.width.equalTo(540).priority(ConstraintPriority.high)
    }
  }
}
