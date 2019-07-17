import Foundation
import RxSwift
import RxRelay

final class ViewCounter: ViewCounterType {
  private let cache: CacheType
  private let disposeBag = DisposeBag()

  private var counter: [Article: Int] = [:]

  private let viewCountUpdated = PublishRelay<ViewCounterType>()
  var viewsUpdated: Observable<ViewCounterType> {
    return viewCountUpdated
      .asObservable()
      .startWith(self)
  }

  init(cache: CacheType = MemoryCache()) {
    self.cache = cache

    if Services.metadebug {
      Observable<Int>
        .interval(RxTimeInterval.seconds(2), scheduler: MainScheduler.instance)
        .subscribe(onNext: { [weak self] _ in
          if let self = self {
            self.viewCountUpdated.accept(self)
          }
        })
        .disposed(by: disposeBag)
    }
  }

  func view(article: Article) {
    counter[article, default: 0] += 1
    viewCountUpdated.accept(self)
  }

  func getViewCount(article: Article) -> Int {
    if Services.metadebug {
      return Int.random(in: 0..<100)
    }
    return counter[article] ?? 0
  }
}
