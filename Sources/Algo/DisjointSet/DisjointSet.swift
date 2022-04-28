//  Created by Mikhail Dudarev on 28.04.2022.

protocol DisjointSet {
    
    associatedtype Element
    
    /// Creates a new set for the given elements. Each element belongs to its own group.
    init(_ elements: [Element])
    
    /// Returns an identifier of the group, that given element belongs to.
    func find(_ element: Element) throws -> Int
    
    /// Indicates whether two given elements are in the same group.
    func connected(_ element1: Element, _ element2: Element) throws -> Bool
    
    /// Connects two given elements. Returns `false` if they are already connected.
    mutating func union(_ element1: Element, _ element2: Element) throws -> Bool
    
}

enum DisjointSetError: Error {
    case elementNotFound(_ element: Any)
}
