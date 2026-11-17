import And

/// Negates a `Bool`-returning closure: `.filter(!set.contains)`.
@inlinable public prefix func !<Input, Error>(
  getBool: @escaping (Input) throws(Error) -> Bool
) -> (Input) throws(Error) -> Bool {
  getBool&.map(!)
}

/// Negates a `Bool`-returning closure that takes no arguments.
@inlinable public prefix func !<Error>(
  getBool: @escaping () throws(Error) -> Bool
) -> () throws(Error) -> Bool {
  getBool&.map(!)
}

public extension KeyPath where Value == Bool {
  /// Negates a `Bool` property, as a closure: `.map(!\.isEmpty)`.
  @inlinable static prefix func !(keyPath: KeyPath) -> (Root) -> Bool {
    { !$0[keyPath: keyPath] }
  }
}
