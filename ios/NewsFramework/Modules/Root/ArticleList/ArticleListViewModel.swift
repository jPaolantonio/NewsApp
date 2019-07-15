import Foundation
import Moya
import RxCocoa
import RxDataSources
import RxSwift

final class ArticleListViewModel: ViewModel {
  private let networking: Networking
  
  private let rows: BehaviorRelay<[ArticleListRow]>
  var sections: Observable<[ArticleListSection]> {
    return rows.map { [ ArticleListSection(items: $0) ] }
  }
  
  init(sources: SourcesServiceType,
       networking: Networking = Networking()) {
    self.networking = networking
    
    self.rows = BehaviorRelay(value: [ArticleListRow.loading])
  }
  
  func start() {
    fetchArticles()
      .catchErrorJustReturn([])
      .bind(to: rows)
      .disposed(by: disposeBag)
  }
  
  func fetchArticles() -> Observable<[ArticleListRow]> {
    let request = TopHeadlinesRequest()

    let articleAdapter: (Article) -> ArticleListRow = { article in
      let data = ArticleCell.Data(title: article.title)
      return ArticleListRow.article(article: article, data: data)
    }

    return networking
      .request(NewsApi.topHeadlines(request: request))
      .filterSuccessfulStatusCodes()
      .map(TopHeadlinesResponse.self)
      .map { (response) -> [ArticleListRow] in
        response.articles ||> articleAdapter
      }
      .asObservable()
  }
}
