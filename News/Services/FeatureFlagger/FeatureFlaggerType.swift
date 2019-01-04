import Foundation

protocol FeatureFlaggerType {
  func isFeatureFlagEnabled(_ featureFlag: FeatureFlag) -> Bool
}
