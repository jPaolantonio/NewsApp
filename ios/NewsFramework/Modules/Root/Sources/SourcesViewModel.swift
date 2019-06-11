import Foundation
import Moya
import RxCocoa
import RxDataSources
import RxSwift

final class SourcesViewModel: ViewModel {
  private let networking: Networking

  private let _sources = BehaviorRelay<[Source]>(value: [])
  var sources: Observable<[Source]> { return _sources.asObservable() }

  private let rows: BehaviorRelay<[SourcesRow]>
  var viewState: Observable<SourcesViewState> {
    return rows.map { SourcesViewState(sections: [ SourcesListSection(items: $0) ]) }
  }

  init(networking: Networking = Networking()) {
    self.networking = networking

    self.rows = BehaviorRelay(value: [SourcesRow.loading])
  }

  func start() {
    fetchSources()
      .catchErrorJustReturn([])
      .bind(to: rows)
      .disposed(by: disposeBag)
  }

  func fetchSources() -> Observable<[SourcesRow]> {
    let sourcesAdapter: (Source) -> SourcesRow = { source in
      let data = SourceCell.Data(title: source.name)
      return SourcesRow.source(source: source, data: data)
    }

    return networking
      .request(NewsApi.sources)
      .filterSuccessfulStatusCodes()
      .map(SourcesResponse.self)
      .map { (response) -> [SourcesRow] in
        response.sources ||> sourcesAdapter
      }
      .asObservable()
  }
}
