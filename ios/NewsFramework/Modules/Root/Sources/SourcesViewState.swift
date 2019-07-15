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

  typealias Identity = String
  var identity: String {
    switch self {
    case .loading:
      return "Loading"
    case let .source(source, data):
      return "Source \(source.hashValue) \(data.hashValue)"
    }
  }
}

typealias SourcesListSection = SingleSectionModel<SourcesRow>
