import Foundation
import RxSwift

protocol FeatureFlaggerType {
  var featureFlags: Observable<[FeatureFlag]> { get }
  var currentFeatureFlags: [FeatureFlag] { get }
}
