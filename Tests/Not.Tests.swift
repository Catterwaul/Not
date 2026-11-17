import Not
import Testing

enum Not_Tests {
  @Test static func `A negated Bool-returning closure returns the opposite of what the closure returns`() {
    let isEven = { (int: Int) in int.isMultiple(of: 2) }
    #expect([1, 2, 3, 4].filter(!isEven) == [1, 3])
  }

  @Test static func `A negated method reference removes the elements the method accepts`() {
    let evens: Set = [2, 4]
    #expect([1, 2, 3, 4].filter(!evens.contains) == [1, 3])
  }

  @Test static func `A negated closure without parameters returns the opposite`() {
    #expect((!{ true })() == false)
  }

  @Test static func `A negated key path returns the opposite of the property`() {
    #expect(["", "🐈"].map(!\.isEmpty) == [false, true])
  }

  @Test static func `A negated Bool-returning closure throws what the closure throws`() {
    struct ClosureError: Error, Equatable { }
    let failing = { (_: Int) throws(ClosureError) -> Bool in throw ClosureError() }
    #expect(throws: ClosureError()) { try (!failing)(1) }
  }
}
