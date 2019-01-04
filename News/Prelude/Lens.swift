import Foundation

struct Lens<A, B> {
  let get: (A) -> B
  let set: (B, A) -> A
}
