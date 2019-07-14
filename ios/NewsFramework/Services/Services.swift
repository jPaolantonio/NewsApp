import Foundation

final class Services {
  let sources: SourcesServiceType

  init() {
    sources = SourcesService()
  }
}
