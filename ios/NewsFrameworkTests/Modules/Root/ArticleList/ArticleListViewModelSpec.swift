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
    var disposeBag: DisposeBag!
    
    beforeEach {
      disposeBag = DisposeBag()
      
      let networking = Networking.makeStubbed(responseObject: TopHeadlinesResponse.template)
      subject = ArticleListViewModel(networking: networking)
    }
    
    afterEach {
      disposeBag = nil
    }
    
    describe("table view data") {
      var rows: [ArticleListRow] = []
      
      beforeEach() {
        rows = []
      }
      
      it("shows loading state") {
        subject
          .sections
          .subscribe(onNext: { sections in
            rows = sections[0].items
          })
          .disposed(by: disposeBag)
        
        expect(rows).to(haveCount(1))
        expect(rows[0]) == ArticleListRow.loading
      }
      
      it("can fetch articles") {
        subject
          .fetchArticles()
          .asObservable()
          .subscribe(onNext: { rows = $0 } )
          .disposed(by: disposeBag)
        
        expect(rows).to(haveCount(1))
        switch rows[0] {
        case let .article(_, data):
          expect(data) == ArticleCell.Data(title: "Lorem Ipsum Dolor")
        default:
          fail()
        }
      }
    }
  }
}