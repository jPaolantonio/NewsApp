import Foundation
import Moya
import RxCocoa
import RxDataSources
import RxSwift

final class ArticleListViewModel: ViewModel {
  private let featureFlagger: FeatureFlaggerType
  private let filteredSourcesService: FilteredSourcesServiceType
  private let networking: Networking
  
  private let rows: BehaviorRelay<[ArticleListRow]>
  var sections: Observable<[ArticleListSection]> {
    return rows.map { [ ArticleListSection(items: $0) ] }
  }
  
  init(sourcesService: FilteredSourcesServiceType,
       featureFlagger: FeatureFlaggerType = FeatureFlagger(),
       networking: Networking = Networking()) {
    self.networking = networking
    self.filteredSourcesService = sourcesService
    self.featureFlagger = featureFlagger
    
    self.rows = BehaviorRelay(value: [ArticleListRow.loading])

    super.init()
    
    setupBindings()
  }
  
  func start() {
    fetchArticles()
      .catchErrorJustReturn([])
      .bind(to: rows)
      .disposed(by: disposeBag)
  }

  private func setupBindings() {
    filteredSourcesService
      .filteredSources
      .subscribe(onNext: { [weak self] _ in
        self?.start()
      })
      .disposed(by: disposeBag)
  }
  
  func fetchArticles() -> Observable<[ArticleListRow]> {
    self.rows.accept([ArticleListRow.loading])

    let request = TopHeadlinesRequest(sources: filteredSourcesService.currentFilteredSources)

//    let articleAdapter: (Article) -> ArticleListRow = { article in
//      let data = ArticleCell.Data(title: article.title)
//      return ArticleListRow.article(article: article, data: data)
//    }

    let articleAdapter: (Article) -> ArticleListRow = { article in
      let data = ArticleViewCell.Data(title: article.title, likes: "4")
      return ArticleListRow.articleView(article: article, data: data)
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
