import Foundation
import RxRelay
import RxSwift

final class FeatureFlagger: FeatureFlaggerType {
  private let _featureFlags: BehaviorRelay<[FeatureFlag]> = BehaviorRelay.init(value: [])

  var featureFlags: Observable<[FeatureFlag]> {
    return _featureFlags.asObservable()
  }

  var currentFeatureFlags: [FeatureFlag] {
    return _featureFlags.value
  }
}
