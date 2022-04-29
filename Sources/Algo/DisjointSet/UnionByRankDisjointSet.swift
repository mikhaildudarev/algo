//  Created by Mikhail Dudarev on 29.04.2022.

public extension DisjointSet {
    
    struct UnionByRank<Element: Hashable>: DisjointSetProtocol {
        
        private(set) var nodes = [Node<Element>]()
        private(set) var nodeIndices = [Element: Int]()
        private var ranks: [Int]
        
        /// - Complexity: O(N)
        public init(_ elements: [Element]) {
            nodes.reserveCapacity(elements.count)
            for (index, element) in elements.enumerated() {
                nodeIndices[element] = index
                nodes.append(Node(element: element, parentIndex: index))
            }
            
            ranks = elements.map { _ in Int.zero }
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
        
        /// - Complexity: O(log N)
        public func connected(_ element1: Element, _ element2: Element) throws -> Bool {
            try find(element1) == find(element2)
        }
        
        /// - Complexity: O(log N)
        @discardableResult public mutating func union(_ element1: Element, _ element2: Element) throws -> Bool {
            let rootIndex1 = try find(element1)
            let rootIndex2 = try find(element2)
            guard rootIndex1 != rootIndex2 else {
                return false
            }
            if ranks[rootIndex1] > ranks[rootIndex2] {
                connectNode(at: rootIndex1, to: rootIndex2)
            } else if ranks[rootIndex1] < ranks[rootIndex2] {
                connectNode(at: rootIndex2, to: rootIndex1)
            } else {
                connectNode(at: rootIndex1, to: rootIndex2)
                ranks[rootIndex2] += 1
            }
            
            return true
        }
        
        /// - Complexity: O(1)
        private mutating func connectNode(at index1: Int, to index2: Int) {
            nodes[index1].parentIndex = index2
        }
        
    }
    
}
