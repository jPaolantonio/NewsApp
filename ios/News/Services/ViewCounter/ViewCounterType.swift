import Foundation

protocol ViewCounterType {
  func view(article: Article)
  func getViewCount(article: Article) -> Int
}
