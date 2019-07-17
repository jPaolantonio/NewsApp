import Foundation

final class Services {
  let sources: FilteredSourcesServiceType

  init() {
    sources = FilteredSourcesService()
  }
}
