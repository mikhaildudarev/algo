//  Created by Mikhail Dudarev on 04.07.2022.

extension BinaryTree {
    
    public struct Iterator: IteratorProtocol {
        
        public enum TraversalType {
            
            case preOrder
            case inOrder
            case postOrder
            case levelOrder
            
            func traverse(root: Node?) -> [Node] {
                switch self {
                case .preOrder:
                    return traversePreOrder(root: root)
                case .inOrder:
                    return traverseInOrder(root: root)
                case .postOrder:
                    return traversePostOrder(root: root)
                case .levelOrder:
                    return traverseLevelOrder(root: root)
                }
            }
            
            private func traversePreOrder(root: Node?) -> [Node] {
                var result = [Node]()
                traversePreOrder(node: root, result: &result)
                return result
            }
            
            private func traversePreOrder(node: Node?, result: inout [Node]) {
                guard let node = node else {
                    return
                }
                result.append(node)
                if let left = node.left {
                    traversePreOrder(node: left, result: &result)
                }
                if let right = node.right {
                    traversePreOrder(node: right, result: &result)
                }
            }
            
            private func traverseInOrder(root: Node?) -> [Node] {
                var result = [Node]()
                traverseInOrder(node: root, result: &result)
                return result
            }
            
            private func traverseInOrder(node: Node?, result: inout [Node]) {
                guard let node = node else {
                    return
                }
                if let left = node.left {
                    traverseInOrder(node: left, result: &result)
                }
                result.append(node)
                if let right = node.right {
                    traverseInOrder(node: right, result: &result)
                }
            }
            
            private func traversePostOrder(root: Node?) -> [Node] {
                var result = [Node]()
                traversePostOrder(node: root, result: &result)
                return result
            }
            
            private func traversePostOrder(node: Node?, result: inout [Node]) {
                guard let node = node else {
                    return
                }
                if let left = node.left {
                    traversePostOrder(node: left, result: &result)
                }
                if let right = node.right {
                    traversePostOrder(node: right, result: &result)
                }
                result.append(node)
            }
            
            private func traverseLevelOrder(root: Node?) -> [Node] {
                guard let root = root else {
                    return []
                }
                var result = [Node]()
                var queue = Queue.Naive<Node>()
                queue.enqueue(root)
                while queue.peek() != nil {
                    let tempQueue = Queue.Naive<Node>()
                    while let node = queue.dequeue() {
                        result.append(node)
                        if let left = node.left {
                            tempQueue.enqueue(left)
                        }
                        if let right = node.right {
                            tempQueue.enqueue(right)
                        }
                    }
                    queue = tempQueue
                }
                return result
            }
            
        }
        
        private var nodesIterator: IndexingIterator<[Node]>
        
        init(type: TraversalType, root: Node?) {
            nodesIterator = type.traverse(root: root).makeIterator()
        }
        
        public mutating func next() -> Node? {
            nodesIterator.next()
        }
        
    }
    
}
