@testable import News
@testable import NewsFramework

import Foundation
import Nimble
import Quick

class ArticleDetailInteractorSpec: QuickSpec {
  override func spec() {
    var subject: ArticleDetailInteractor!
    
    beforeEach {
      subject = ArticleDetailInteractor(article: Article.template)
    }
    
    it("computes title") {
      expect(subject.title).to(equal("Lorem Ipsum Dolor"))
    }
  }
}
