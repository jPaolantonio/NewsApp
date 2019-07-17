import Foundation
import RxRelay
import RxSwift

final class FeatureFlagger: FeatureFlaggerType {
  private let _featureFlags: BehaviorRelay<[FeatureFlag]> = BehaviorRelay.init(value: [.newDesignedCells])
  private let disposeBag = DisposeBag()
  
  init() {
    if Services.metadebug {
      Observable<Int>
        .interval(RxTimeInterval.seconds(3), scheduler: MainScheduler.instance)
        .subscribe(onNext: { [weak self] _ in
          if Bool.random() {
            self?._featureFlags.accept(FeatureFlag.allCases)
          } else {
            self?._featureFlags.accept([])
          }
        })
        .disposed(by: disposeBag)
    }
  }

  var featureFlags: Observable<[FeatureFlag]> {
    return _featureFlags.asObservable()
  }

  var currentFeatureFlags: [FeatureFlag] {
    return _featureFlags.value
  }
}
