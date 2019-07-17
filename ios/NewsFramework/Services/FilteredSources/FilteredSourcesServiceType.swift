import Foundation
import RxSwift

protocol FilteredSourcesServiceType {
  var filteredSources: Observable<[Source]> { get }
  var currentFilteredSources: [Source] { get }

  func setSources(_ sources: [Source])
}
