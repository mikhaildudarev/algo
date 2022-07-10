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
    
    public init(levelOrderedArray: [Element?]) throws {
        guard let firstElement = levelOrderedArray.first else {
            self.root = nil
            return
        }
        
        guard let firstElement = firstElement else {
            throw Failure.cannotBuildTreeFromLevelOrderedArray(levelOrderedArray)
        }
        
        let elementsQueue = Queue.Naive<Element?>()
        for element in levelOrderedArray.dropFirst() {
            elementsQueue.enqueue(element)
        }
        
        let nodesQueue = Queue.Naive<Node>()
        let root = Node(value: firstElement)
        nodesQueue.enqueue(root)
        
        while elementsQueue.peek() != nil {
            let node = nodesQueue.dequeue()
            if let leftElement = elementsQueue.dequeue(), let leftElement = leftElement {
                let leftNode = Node(value: leftElement)
                node?.left = leftNode
                nodesQueue.enqueue(leftNode)
            }
            if let rightElement = elementsQueue.dequeue(), let rightElement = rightElement {
                let rightNode = Node(value: rightElement)
                node?.right = rightNode
                nodesQueue.enqueue(rightNode)
            }
        }
        
        self.root = root
    }
}

extension BinaryTree: Sequence {

    public func makeIterator() -> Iterator {
        Iterator(type: iteratorType, root: root)
    }
    
}

public extension BinaryTree {
        
    enum Failure: Error {
        case cannotBuildTreeFromLevelOrderedArray(_ array: [Element?])
    }
    
}
