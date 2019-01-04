import Foundation

precedencegroup ForwardApplication {
  associativity: left
}

infix operator |>: ForwardApplication

precedencegroup ForwardComposition {
  associativity: left
  higherThan: ForwardApplication
}

infix operator >>>: ForwardComposition

public func |> <A, B>(x: A, f: (A) -> B) -> B {
  return f(x)
}

public func >>> <A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
  return { g(f($0)) }
}

public func zurry<A>(_ f: () -> A) -> A {
  return f()
}

public func flip<A, B, C>(_ f: @escaping (A) -> (B) -> C) -> (B) -> (A) -> C {

  return { b in { a in f(a)(b) } }
}

public func flip<A, C>(_ f: @escaping (A) -> () -> C) -> () -> (A) -> C {

  return { { a in f(a)() } }
}


precedencegroup SingleTypeComposition {
  associativity: left
  higherThan: ForwardApplication
}

infix operator <>: SingleTypeComposition

public func <> <A>(f: @escaping (A) -> A, g: @escaping (A) -> A) -> (A) -> A {
  return f >>> g
}

precedencegroup BackwardsComposition {
  associativity: left
}
infix operator <<<: BackwardsComposition
public func <<< <A, B, C>(_ f: @escaping (B) -> C, _ g: @escaping (A) -> B) -> (A) -> C {
  return { f(g($0)) }
}

public func second<A, B, C>(_ f: @escaping (B) -> C) -> ((A, B)) -> (A, C) {
  return { pair in
    return (pair.0, f(pair.1))
  }
}

public func map<A, B>(_ f: @escaping (A) -> B) -> ([A]) -> [B] {
  return { $0.map(f) }
}

func prop<Root, Value>(_ kp: WritableKeyPath<Root, Value>)
  -> (@escaping (Value) -> Value)
  -> (Root)
  -> Root {

    return { update in
      { root in
        var copy = root
        copy[keyPath: kp] = update(copy[keyPath: kp])
        return copy
      }
    }
}
