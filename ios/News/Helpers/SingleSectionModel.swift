import Foundation
import RxDataSources
import RxSwift

struct SingleSectionModel<ItemType: IdentifiableType & Equatable> {
  typealias Identity = Int
  let identity: Int = 0

  public var items: [ItemType]
}

extension SingleSectionModel: AnimatableSectionModelType {
  init(original: SingleSectionModel<ItemType>, items: [ItemType]) {
    self.items = items
  }
}
