import Foundation

final class LikeCounter: ViewCounterType {
  private let cache: CacheType

  private var counter: [Article: Int] = [:]

  init(cache: CacheType) {
    self.cache = cache
  }

  func view(article: Article) {
    counter[article, default: 0] += 1
  }

  func getViewCount(article: Article) -> Int {
    return counter[article] ?? 0
  }
}
