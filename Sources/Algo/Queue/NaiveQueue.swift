//  Created by Mikhail Dudarev on 03.05.2022.

public extension Queue {
    
    final class Naive<Element>: QueueProtocol {
        
        private(set) var head: Node<Element>?
        private(set) var tail: Node<Element>?
        
        /// - Complexity: O(1)
        public func enqueue(_ element: Element) {
            let node = Node(element: element)
            guard head != nil else {
                head = node
                tail = node
                return
            }
            tail?.next = node
            tail = node
        }
        
        /// - Complexity: O(1)
        @discardableResult public func dequeue() -> Element? {
            guard let head = head else {
                return nil
            }
            if let next = head.next {
                self.head = next
            } else {
                self.head = nil
                self.tail = nil
            }
            return head.element
        }
        
        /// - Complexity: O(1)
        public func peek() -> Element? {
            head?.element
        }
        
    }
    
}
