import Foundation
import SnapKit
import UIKit

final class ArticleViewController: UIViewController {
  private let viewModel: ArticleViewModel
  
  init(viewModel: ArticleViewModel) {
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
  }
}
