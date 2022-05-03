//  Created by Mikhail Dudarev on 03.05.2022.

public extension Stack {
    
    final class Naive<Element>: StackProtocol {
        
        private(set) var top: Node<Element>?
        
        /// - Complexity: O(1)
        public func push(_ element: Element) {
            top = Node(element: element, next: top)
        }
        
        /// - Complexity: O(1)
        @discardableResult public func pop() -> Element? {
            let top = self.top
            self.top = top?.next
            return top?.element
        }
        
        /// - Complexity: O(1)
        public func peek() -> Element? {
            top?.element
        }
        
    }
    
}
