import Foundation

protocol CacheType {
  func get<T: Cacheable>(key: String) -> T?
  func set<T: Cacheable>(key: String, value: T, synchronize: Bool)
}
