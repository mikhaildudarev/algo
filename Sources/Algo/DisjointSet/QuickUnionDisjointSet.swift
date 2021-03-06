//  Created by Mikhail Dudarev on 28.04.2022.

public extension DisjointSet {
    
    final class QuickUnion<Element: Hashable>: DisjointSetProtocol {
        
        public let elements: [Element]
        private(set) var nodes = [Node<Element>]()
        private(set) var nodeIndices = [Element: Int]()        
        
        /// - Complexity: O(N)
        required public init(_ elements: [Element]) {
            self.elements = elements
            
            nodes.reserveCapacity(elements.count)
            
            for (index, element) in elements.enumerated() {
                nodeIndices[element] = index
                nodes.append(Node(element: element, parentIndex: index))
            }
        }
        
        /// - Complexity: O(log N)
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
        
        /// - Complexity: O(log N)
        public func connected(_ element1: Element, _ element2: Element) throws -> Bool {
            try find(element1) == find(element2)
        }
        
        /// - Complexity: O(log N)
        @discardableResult public func union(_ element1: Element, _ element2: Element) throws -> Bool {
            let rootIndex1 = try find(element1)
            let rootIndex2 = try find(element2)
            guard rootIndex1 != rootIndex2 else {
                return false
            }
            nodes[rootIndex1].parentIndex = rootIndex2
            return true
        }
        
    }
    
}
