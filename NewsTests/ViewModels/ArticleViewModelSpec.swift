@testable import News

import Foundation
import Nimble
import Quick

class ArticleViewModelSpec: QuickSpec {
  override func spec() {
    var subject: ArticleViewModel!
    
    beforeEach {
      let article = Article.sample()
      subject = ArticleViewModel(article: article)
    }
    
    it("computes title") {
      expect(subject.title).to(equal("Lorem ipsum dolor sit amet, consectetur adipiscing elit"))
    }
  }
}
