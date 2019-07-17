import Foundation
import Moya
import RxCocoa
import RxDataSources
import RxSwift

final class SourcesViewModel: ViewModel {
  private let networking: Networking
  private let filteredSourcesService: FilteredSourcesServiceType
  private let selectedSources: BehaviorRelay<[Source]>

  private let rows: BehaviorRelay<[SourcesRow]>
  var viewState: Observable<SourcesViewState> {
    return rows.map { SourcesViewState(sections: [ SourcesListSection(items: $0) ]) }
  }

  init(sourcesService: FilteredSourcesServiceType,
       networking: Networking = Networking()) {
    self.networking = networking
    self.filteredSourcesService = sourcesService

    self.selectedSources = BehaviorRelay(value: sourcesService.currentFilteredSources)
    self.rows = BehaviorRelay(value: [SourcesRow.loading])
  }

  func start() {
    let fetchedSources = networking
      .request(NewsApi.sources)
      .map(SourcesResponse.self)
      .map { $0.sources }
      .catchErrorJustReturn([])
      .asObservable()

    let rows = Observable
      .combineLatest(fetchedSources, selectedSources.asObservable())
      .map { fetchedSources, selectedSources -> [SourcesRow] in
        return fetchedSources
          .map { source -> SourcesRow in
            if selectedSources.contains(source) {
              let data = SourceCell.Data(title: source.name, selected: true)
              return SourcesRow.source(source: source, data: data)
            } else {
              let data = SourceCell.Data(title: source.name, selected: false)
              return SourcesRow.source(source: source, data: data)
            }
        }
    }

    rows
      .bind(to: self.rows)
      .disposed(by: disposeBag)
  }

  func selectSource(_ source: Source) {
    var sources = selectedSources.value
    if let index = sources.firstIndex(of: source) {
      sources.remove(at: index)
    } else {
      sources.append(source)
    }
    selectedSources.accept(sources)
  }

  func saveFilteredSources() {
    filteredSourcesService.setSources(selectedSources.value)
  }
}
