//  Created by Mikhail Dudarev on 28.04.2022.

/**
 https://en.wikipedia.org/wiki/Disjoint-set_data_structure
 */

public protocol DisjointSetProtocol {
    
    associatedtype Element
    
    /// Creates a new set for the given elements. Each element belongs to its own group.
    init(_ elements: [Element])
    
    /// Returns an identifier of the group, that given element belongs to.
    func find(_ element: Element) throws -> Int
    
    /// Indicates whether two given elements are in the same group.
    func connected(_ element1: Element, _ element2: Element) throws -> Bool
    
    /// Connects two given elements. Returns `false` if they are already connected.
    @discardableResult func union(_ element1: Element, _ element2: Element) throws -> Bool
    
}

public enum DisjointSet {
        
    struct Node<Element> {
        let element: Element
        var parentIndex: Int
    }
    
}

public extension DisjointSet {
    
    enum Failure: Error {
        case elementNotFound(_ element: Any)
    }
    
}
