import Foundation

final class MemoryCache: CacheType {
  func get<T>(key: String) -> T? where T : Cacheable {
    guard let data = UserDefaults.standard.string(forKey: key) else { return nil }
    return T.decode(data: data) as? T
  }

  func set<T>(key: String, value: T, synchronize: Bool) where T : Cacheable {
    UserDefaults.standard.set(value.encode(), forKey: key)
  }
}
