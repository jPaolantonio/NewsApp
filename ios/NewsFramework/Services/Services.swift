import Foundation

final class Services {
  let sources: FilteredSourcesServiceType
  let viewCounter: ViewCounterType

  init() {
    sources = FilteredSourcesService()
    viewCounter = ViewCounter()
  }

  static let metadebug = true
}
