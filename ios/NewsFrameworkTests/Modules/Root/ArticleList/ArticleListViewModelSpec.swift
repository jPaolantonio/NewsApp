@testable import News
@testable import NewsFramework

import Foundation
import Moya
import Nimble
import Quick
import RxSwift

class ArticleListViewModelSpec: QuickSpec {
  override func spec() {
    var subject: ArticleListViewModel!
    var sources: MockSourcesService!
    var disposeBag: DisposeBag!
    
    beforeEach {
      disposeBag = DisposeBag()
      
      let networking = Networking.makeStubbed(responseObject: TopHeadlinesResponse.template)
      sources = MockSourcesService()
      subject = ArticleListViewModel(sourcesService: sources, networking: networking)
    }
    
    afterEach {
      disposeBag = nil
    }
    
    describe("table view data") {
      var rows: [ArticleListRow] = []
      
      beforeEach() {
        rows = []
      }
      
//      it("can fetch articles") {
//        subject
//          .fetchArticles()
//          .asObservable()
//          .subscribe(onNext: { rows = $0 } )
//          .disposed(by: disposeBag)
//        
//        expect(rows).to(haveCount(1))
//        switch rows[0] {
//        case let .article(_, data):
//          expect(data) == ArticleCell.Data(title: "Lorem Ipsum Dolor")
//        default:
//          fail()
//        }
//      }
    }
  }
}
