import Foundation
import Moya
import RxCocoa
import RxDataSources
import RxSwift

enum ArticleListRow: Equatable, IdentifiableType {
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

typealias ArticleListSection = SingleSectionModel<ArticleListRow>
