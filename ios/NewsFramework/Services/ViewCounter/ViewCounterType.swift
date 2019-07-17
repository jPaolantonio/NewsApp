import Foundation
import RxSwift

protocol ViewCounterType {
  var viewsUpdated: Observable<ViewCounterType> { get }
  
  func view(article: Article)
  func getViewCount(article: Article) -> Int
}
