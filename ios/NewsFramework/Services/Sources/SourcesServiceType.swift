import Foundation
import RxSwift

protocol SourcesServiceType {
  var filteredSources: Observable<[Source]> { get }

  func reset()
  func addSource(_ source: Source)
}
