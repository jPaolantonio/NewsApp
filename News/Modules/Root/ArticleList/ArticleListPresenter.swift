import Foundation
import Moya
import RxCocoa
import RxDataSources
import RxSwift

final class ArticleListPresenter: Presenter {
  private let networking: Networking
  
  private let _articles = BehaviorRelay<[Article]>(value: [])
  var articles: Observable<[Article]> { return _articles.asObservable() }
  
  private let rows: BehaviorRelay<[ArticleListRow]>
  var sections: Observable<[ArticleListSection]> {
    return rows.map { [ ArticleListSection(items: $0) ] }
  }
  
  init(networking: Networking = Networking()) {
    self.networking = networking
    
    self.rows = BehaviorRelay(value: [ArticleListRow.loading])
  }
  
  func refreshArticles() {
    fetchArticles()
      .catchErrorJustReturn([])
      .bind(to: rows)
      .disposed(by: disposeBag)
  }
  
  func fetchArticles() -> Observable<[ArticleListRow]> {
    let request = TopHeadlinesRequest()
    
    return networking
      .request(NewsApi.topHeadlines(request: request))
      .filterSuccessfulStatusCodes()
      .map(TopHeadlinesResponse.self)
      .map { $0.articles }
      .mapToRows()
      .asObservable()
  }
}

extension PrimitiveSequenceType where TraitType == SingleTrait, ElementType == [Article] {
  fileprivate func mapToRows() -> Single<[ArticleListRow]> {
    return map { $0.mapToRows() }
  }
}

extension Sequence where Element == Article {
  func mapToRows() -> [ArticleListRow] {
    return map { ArticleListRow.article(article: $0, data: $0.makeCellData()) }
  }
}

extension Article {
  func makeCellData() -> ArticleCell.Data {
    return ArticleCell.Data(title: title)
  }
}
