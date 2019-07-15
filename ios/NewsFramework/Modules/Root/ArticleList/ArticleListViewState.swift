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
  case article(article: Article, data: ArticleCell.Data)
  
  typealias Identity = String
  var identity: String {
    switch self {
    case .loading:
      return "Loading"
    case let .article(article, data):
      return "Article \(article.hashValue) \(data.hashValue)"
    }
  }
}

typealias ArticleListSection = SingleSectionModel<ArticleListRow>
