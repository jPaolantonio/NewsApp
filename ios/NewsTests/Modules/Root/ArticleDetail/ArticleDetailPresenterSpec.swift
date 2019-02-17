@testable import News

import Foundation
import Nimble
import Quick

class ArticleDetailPresenterSpec: QuickSpec {
  override func spec() {
    var subject: ArticleDetailPresenter!
    
    beforeEach {
      subject = ArticleDetailPresenter(article: Article.template)
    }
    
    it("computes title") {
      expect(subject.title).to(equal("Lorem Ipsum Dolor"))
    }
  }
}
