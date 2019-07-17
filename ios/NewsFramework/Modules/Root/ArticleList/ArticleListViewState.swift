import Foundation
import Moya
import RxCocoa
import RxDataSources
import RxSwift

struct ArticleListViewState {
  let sections: [ArticleListSection]
}

enum ArticleListRow: Equatable, IdentifiableType {
  case loading
  case error(data: ErrorCell.Data)
  case article(article: Article, data: ArticleCell.Data)
  case articleView(article: Article, data: ArticleViewCell.Data)
  
  typealias Identity = String
  var identity: String {
    switch self {
    case .loading:
      return "Loading"
    case .error:
      return "Error"
    case let .article(article, _):
      return "Article \(article.description))"
    case let .articleView(article, _):
      return "ArticleView \(article.description))"
    }
  }
}

typealias ArticleListSection = SingleSectionModel<ArticleListRow>
