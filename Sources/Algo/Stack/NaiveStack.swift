//  Created by Mikhail Dudarev on 03.05.2022.

public extension Stack {
    
    final class Naive<Element>: StackProtocol {
        
        private(set) var head: Node<Element>?
        
        /// - Complexity: O(1)
        public func push(_ element: Element) {
            head = Node(element: element, next: head)
        }
        
        /// - Complexity: O(1)
        @discardableResult public func pop() -> Element? {
            let head = self.head
            self.head = head?.next
            return head?.element
        }
        
        /// - Complexity: O(1)
        public func peek() -> Element? {
            head?.element
        }
        
    }
    
}
