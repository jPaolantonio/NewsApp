@testable import News

import Foundation
import Moya
import Nimble
import Quick
import RxSwift

class ArticlesViewModelSpec: QuickSpec {
  override func spec() {
    var subject: ArticlesViewModel!
    var disposeBag: DisposeBag!
    
    beforeEach {
      disposeBag = DisposeBag()
      
      let networking = Networking.makeStubbed(responseObject: TopHeadlinesResponse.sample())
      subject = ArticlesViewModel(networking: networking)
    }

    afterEach {
      disposeBag = nil
    }
    
    it("can fetch articles") {
      var rows: [ArticlesRow] = []

      subject
        .fetchArticles()
        .asObservable()
        .subscribe(onNext: { rows = $0})
        .disposed(by: disposeBag)

      expect(rows).to(haveCount(1))
    }
  }
}
