import Foundation
import RxRelay
import RxSwift

final class FilteredSourcesService: FilteredSourcesServiceType {
  private let _filteredSources: BehaviorRelay<[Source]>
  var filteredSources: Observable<[Source]> {
    return _filteredSources.asObservable()
  }

  var currentFilteredSources: [Source] {
    return _filteredSources.value
  }

  init() {
    self._filteredSources = BehaviorRelay(value: [])
  }

  func reset() {
    _filteredSources.accept([])
  }

  func setSources(_ sources: [Source]) {
    _filteredSources.accept(sources)
  }
}
