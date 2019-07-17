import Foundation
import Moya
import RxCocoa
import RxDataSources
import RxSwift

final class ArticleListViewModel: ViewModel {
  private let featureFlagger: FeatureFlaggerType
  private let filteredSourcesService: FilteredSourcesServiceType
  private let networking: Networking
  private let viewCounter: ViewCounterType

  private let articles: BehaviorRelay<[Article]>
  private let rows: BehaviorRelay<[ArticleListRow]>
  var sections: Observable<[ArticleListSection]> {
    return rows.map { [ ArticleListSection(items: $0) ] }
  }
  
  init(sourcesService: FilteredSourcesServiceType,
       featureFlagger: FeatureFlaggerType = FeatureFlagger(),
       viewCounter: ViewCounterType = ViewCounter(),
       networking: Networking = Networking()) {
    self.featureFlagger = featureFlagger
    self.filteredSourcesService = sourcesService
    self.networking = networking
    self.viewCounter = viewCounter

    self.articles = BehaviorRelay(value: [])
    self.rows = BehaviorRelay(value: [])

    super.init()
    
    setupBindings()
  }
  
  func start() {
    refetchArticles()
  }

  private func setupBindings() {
    filteredSourcesService
      .filteredSources
      .subscribe(onNext: { [weak self] _ in
        self?.refetchArticles()
      })
      .disposed(by: disposeBag)

    let articleAdapter: (Article) -> ArticleListRow = { article in
      let data = ArticleCell.Data(title: article.title)
      return ArticleListRow.article(article: article, data: data)
    }

    let articleViewAdapter: (ViewCounterType) -> (Article) -> ArticleListRow = { viewCounter in
      return { article in
        let data = ArticleViewCell.Data(title: article.title, likes: "\(viewCounter.getViewCount(article: article))")
        return ArticleListRow.articleView(article: article, data: data)
      }
    }

    let featureFlagEnabled = featureFlagger
      .featureFlags
      .map { $0.contains(.newDesignedCells) }

    let viewsUpdated = viewCounter.viewsUpdated

    Observable
      .combineLatest(articles, featureFlagEnabled, viewsUpdated)
      .map { articles, featureFlagEnabled, viewCounter -> [ArticleListRow] in
        if featureFlagEnabled {
          return articles ||> articleViewAdapter(viewCounter)
        } else {
          return articles ||> articleAdapter
        }
      }
      .bind(to: rows)
      .disposed(by: disposeBag)
  }

  private func refetchArticles() {
    self.rows.accept([ArticleListRow.loading])

    let request = TopHeadlinesRequest(sources: filteredSourcesService.currentFilteredSources)

    networking
      .request(NewsApi.topHeadlines(request: request))
      .filterSuccessfulStatusCodes()
      .map(TopHeadlinesResponse.self)
      .map { $0.articles }
      .subscribe(onSuccess: { [weak self] articles in
        self?.articles.accept(articles)
        }, onError: { error in
          print("Error \(error)")
      })
      .disposed(by: disposeBag)
  }
}
