//  Created by Mikhail Dudarev on 28.04.2022.

public extension DisjointSet {
    
    struct QuickFind<Element: Hashable>: DisjointSetProtocol {
        
        private(set) var nodes = [Node<Element>]()
        private(set) var nodeIndices = [Element: Int]()
        
        /// - Complexity: O(N)
        public init(_ elements: [Element]) {
            nodes.reserveCapacity(elements.count)
            
            for (index, element) in elements.enumerated() {
                nodeIndices[element] = index
                nodes.append(Node(element: element, parentIndex: index))
            }
        }
        
        /// - Complexity: O(1)
        public func find(_ element: Element) throws -> Int {
            guard let index = nodeIndices[element] else {
                throw DisjointSet.Failure.elementNotFound(element)
            }
            return nodes[index].parentIndex
        }
        
        /// - Complexity: O(1)
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
            nodes = nodes.map {
                Node(
                    element: $0.element,
                    parentIndex: $0.parentIndex == parentIndex1 ? parentIndex2 : $0.parentIndex
                )
            }
            return true
        }
        
    }
    
}
