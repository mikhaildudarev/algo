//  Created by Mikhail Dudarev on 28.04.2022.

public extension DisjointSet {
    
    struct QuickUnion<Element: Hashable>: DisjointSetProtocol {
        
        private(set) var nodes = [Node]()
        private(set) var nodeIndices = [Element: Int]()
        
        /// - Complexity: O(N)
        public init(_ elements: [Element]) {
            nodes.reserveCapacity(elements.count)
            
            for (index, element) in elements.enumerated() {
                nodeIndices[element] = index
                nodes.append(Node(element: element, parentIndex: index))
            }
        }
        
        /// - Complexity: O(N)
        public func find(_ element: Element) throws -> Int {
            guard var index = nodeIndices[element] else {
                throw DisjointSet.Failure.elementNotFound(element)
            }
            var node = nodes[index]
            while node.parentIndex != index {
                index = node.parentIndex
                node = nodes[index]
            }
            return index
        }
        
        /// - Complexity: O(N)
        public func connected(_ element1: Element, _ element2: Element) throws -> Bool {
            try find(element1) == find(element2)
        }
        
        /// - Complexity: O(N)
        public mutating func union(_ element1: Element, _ element2: Element) throws -> Bool {
            let parentIndex1 = try find(element1)
            let parentIndex2 = try find(element2)
            guard parentIndex1 != parentIndex2 else {
                return false
            }
            nodes[parentIndex1].parentIndex = parentIndex2
            return true
        }
        
    }
    
}

extension DisjointSet.QuickUnion {
    
    struct Node {
        let element: Element
        var parentIndex: Int
    }
    
}