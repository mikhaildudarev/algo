//  Created by Mikhail Dudarev on 03.05.2022.

/**
 https://en.wikipedia.org/wiki/Queue_(abstract_data_type)
 */

public protocol QueueProtocol {
    
    associatedtype Element
    
    /// Adds an element to the top of the stack
    func push(_ element: Element)
    
    /// Removes and returns an element from the top of the stack (if any)
    @discardableResult func pop() -> Element?
    
    /// Returns an element from the top of the stack (if any)
    func peek() -> Element?
    
}

public enum Queue {}

extension Queue {
    
    class Node<Element> {
        let element: Element
        var next: Node<Element>?
        
        init(element: Element, next: Node<Element>? = nil) {
            self.element = element
            self.next = next
        }
    }
    
}
