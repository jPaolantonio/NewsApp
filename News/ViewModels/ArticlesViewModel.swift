import Foundation
import Moya
import RxCocoa
import RxDataSources
import RxSwift

enum ArticlesRow: Equatable, IdentifiableType {
  case loading
  case article(article: Article, data: ArticleCell.Data)
  
  typealias Identity = String
  var identity: String {
    switch self {
    case .loading:
      return "Loading"
    case let .article(article, data):
      return "Article \(article.hash) \(data.hash)"
    }
  }
}

typealias ArticlesLayoutSection = SingleSectionModel<ArticlesRow>

final class ArticlesViewModel: ViewModel {
  private let networking: Networking
  
  private let _articles = BehaviorRelay<[Article]>(value: [])
  var articles: Observable<[Article]> { return _articles.asObservable() }
  
  private let rows: BehaviorRelay<[ArticlesRow]>
  var sections: Observable<[ArticlesLayoutSection]> {
    return rows.map { [ ArticlesLayoutSection(items: $0) ] }
  }
  
  init(networking: Networking = Networking()) {
    self.networking = networking
    
    self.rows = BehaviorRelay(value: [ArticlesRow.loading])
  }
  
  func refreshArticles() {
    fetchArticles()
      .catchErrorJustReturn([])
      .bind(to: rows)
      .disposed(by: disposeBag)
  }
  
  func fetchArticles() -> Observable<[ArticlesRow]> {
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
  fileprivate func mapToRows() -> Single<[ArticlesRow]> {
    return map { $0.mapToRows() }
  }
}

extension Sequence where Element == Article {
  func mapToRows() -> [ArticlesRow] {
    return map { ArticlesRow.article(article: $0, data: $0.makeCellData()) }
  }
}

extension Article {
  func makeCellData() -> ArticleCell.Data {
    return ArticleCell.Data(title: title)
  }
}
