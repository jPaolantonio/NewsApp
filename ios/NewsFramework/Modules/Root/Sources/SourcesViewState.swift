import Foundation
import Moya
import RxCocoa
import RxDataSources
import RxSwift

struct SourcesViewState {
  let sections: [SourcesListSection]
}

enum SourcesRow: Equatable, IdentifiableType {
  case loading
  case source(source: Source, data: SourceCell.Data)
  case selectedSource(source: Source, data: SourceCell.Data)

  typealias Identity = String
  var identity: String {
    switch self {
    case .loading:
      return "Loading"
    case let .source(source, _):
      return "Source \(source.id)"
    case let .selectedSource(source, _):
      return "Source \(source.id)"
    }
  }
}

typealias SourcesListSection = SingleSectionModel<SourcesRow>
