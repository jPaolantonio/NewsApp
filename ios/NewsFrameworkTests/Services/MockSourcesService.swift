@testable import News
@testable import NewsFramework

import RxSwift

final class MockSourcesService: SourcesServiceType {
  let _filteredSources: BehaviorSubject<[Source]>
  var filteredSources: Observable<[Source]> {
    return _filteredSources.asObservable()
  }

  init() {
    self._filteredSources = BehaviorSubject(value: [])
  }

  func reset() {
    _filteredSources.onNext([])
  }

  func addSource(_ source: Source) {
    //    var sources = _filteredSources.val
    _filteredSources.onNext([])
  }
}
