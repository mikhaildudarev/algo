//  Created by Mikhail Dudarev on 29.04.2022.

public extension DisjointSet {
    
    final class UnionByRank<Element: Hashable>: DisjointSetProtocol {
        
        public let elements: [Element]
        private(set) var nodes = [Node<Element>]()
        private(set) var nodeIndices = [Element: Int]()
        private(set) var ranks: [Int]
        
        /// - Complexity: O(N)
        public init(_ elements: [Element]) {
            self.elements = elements
            
            nodes.reserveCapacity(elements.count)
            for (index, element) in elements.enumerated() {
                nodeIndices[element] = index
                nodes.append(Node(element: element, parentIndex: index))
            }
            
            ranks = [Int](repeating: 1, count: elements.count)
        }
        
        /// - Complexity: `O(α(N))`, where `α` refers to the Inverse Ackermann function
        public func find(_ element: Element) throws -> Int {
            guard let index = nodeIndices[element] else {
                throw DisjointSet.Failure.elementNotFound(element)
            }
            guard nodes[index].parentIndex != index else {
                return index
            }
            nodes[index].parentIndex = try find(nodes[nodes[index].parentIndex].element) // path compression optimization
            return nodes[index].parentIndex
        }
        
        /// - Complexity: `O(α(N))`, where `α` refers to the Inverse Ackermann function
        public func connected(_ element1: Element, _ element2: Element) throws -> Bool {
            try find(element1) == find(element2)
        }
        
        /// - Complexity: `O(α(N))`, where `α` refers to the Inverse Ackermann function
        @discardableResult public func union(_ element1: Element, _ element2: Element) throws -> Bool {
            let rootIndex1 = try find(element1)
            let rootIndex2 = try find(element2)
            guard rootIndex1 != rootIndex2 else {
                return false
            }
            
            // connect shorter tree to the taller one, unless they have equal height
            if ranks[rootIndex1] > ranks[rootIndex2] {
                connectNode(at: rootIndex2, to: rootIndex1)
            } else if ranks[rootIndex1] < ranks[rootIndex2] {
                connectNode(at: rootIndex1, to: rootIndex2)
            } else {
                connectNode(at: rootIndex1, to: rootIndex2)
                ranks[rootIndex2] += 1
            }
            
            return true
        }
        
        /// Connects nodes at given indices, so that the node at index 1 becomes child of the node at index 2.
        /// - Complexity: O(1)
        private func connectNode(at index1: Int, to index2: Int) {
            nodes[index1].parentIndex = index2
        }
        
    }
    
}
