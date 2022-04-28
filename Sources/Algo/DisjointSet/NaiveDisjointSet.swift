//  Created by Mikhail Dudarev on 28.04.2022.

struct NaiveDisjointSet<Element: Hashable>: DisjointSet {
    
    private(set) var nodes = [Node]()
    private(set) var nodeIndices = [Element: Int]()
    
    /// - Complexity: O(N)
    init(_ elements: [Element]) {
        nodes.reserveCapacity(elements.count)
        
        for (index, element) in elements.enumerated() {
            nodeIndices[element] = index
            nodes.append(Node(element: element, parentIndex: index))
        }
    }
    
    /// - Complexity: O(N)
    func find(_ element: Element) throws -> Int {
        guard var index = nodeIndices[element] else {
            throw DisjointSetError.elementNotFound(element)
        }
        var node = nodes[index]
        while node.parentIndex != index {
            index = node.parentIndex
            node = nodes[index]
        }
        return index
    }
    
    /// - Complexity: O(N)
    func connected(_ element1: Element, _ element2: Element) throws -> Bool {
        try find(element1) == find(element2)
    }
    
    /// - Complexity: O(N)
    mutating func union(_ element1: Element, _ element2: Element) throws -> Bool {
        let parentIndex1 = try find(element1)
        let parentIndex2 = try find(element2)
        guard parentIndex1 != parentIndex1 else {
            return false
        }
        nodes[parentIndex1].parentIndex = parentIndex2
        return true
    }
    
}

extension NaiveDisjointSet {
    
    struct Node {
        let element: Element
        var parentIndex: Int
    }
    
}
