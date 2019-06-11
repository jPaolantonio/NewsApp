@testable import News
@testable import NewsFramework

import Foundation
import Nimble
import Quick

class ArticleDetailViewModelSpec: QuickSpec {
  override func spec() {
    var subject: ArticleDetailViewModel!
    
    beforeEach {
      subject = ArticleDetailViewModel(article: Article.template)
    }
    
    it("computes title") {
      expect(subject.title).to(equal("Lorem Ipsum Dolor"))
    }
  }
}
