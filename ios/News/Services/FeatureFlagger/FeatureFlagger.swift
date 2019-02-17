import Foundation

final class FeatureFlagger: FeatureFlaggerType {
  func isFeatureFlagEnabled(_ featureFlag: FeatureFlag) -> Bool {
    return false
  }
}
