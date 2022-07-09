//  Created by Mikhail Dudarev on 04.07.2022.

/**
 https://en.wikipedia.org/wiki/Binary_tree
 */

public final class BinaryTree<Element> {
        
    public final class Node {
        
        public var value: Element
        public var left: Node?
        public var right: Node?
        
        public init(value: Element, left: Node? = nil, right: Node? = nil) {
            self.value = value
            self.left = left
            self.right = right
        }
        
    }
    
    public var iteratorType: Iterator.TraversalType = .preOrder
    public let root: Node?
    
    public init(root: Node?) {
        self.root = root
    }
}

extension BinaryTree: Sequence {

    public func makeIterator() -> Iterator {
        Iterator(type: iteratorType, root: root)
    }
    
}
