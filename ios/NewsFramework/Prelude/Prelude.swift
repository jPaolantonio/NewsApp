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

precedencegroup SingleTypeComposition {
  associativity: left
  higherThan: ForwardApplication
}

infix operator <>: SingleTypeComposition

public func <> <A>(f: @escaping (A) -> A, g: @escaping (A) -> A) -> (A) -> A {
  return f >>> g
}

public func <> <A>(f: @escaping (inout A) -> Void, g: @escaping (inout A) -> Void) -> (inout A) -> Void {
  return { a in
    f(&a)
    g(&a)
  }
}

func <> <A: AnyObject>(f: @escaping (A) -> Void, g: @escaping (A) -> Void) -> (A) -> Void {
  return { a in
    f(a)
    g(a)
  }
}

precedencegroup BackwardsComposition {
  associativity: left
}

infix operator <<<: BackwardsComposition
public func <<< <A, B, C>(_ f: @escaping (B) -> C, _ g: @escaping (A) -> B) -> (A) -> C {
  return { f(g($0)) }
}

public func map<A, B>(_ f: @escaping (A) -> B) -> ([A]) -> [B] {
  return { $0.map(f) }
}

infix operator ||>: ForwardApplication
public func ||> <A, B> (xs: [A], f: (A) -> B) -> [B] {
  return xs.map(f)
}
