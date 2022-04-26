/**
 Disjoint Set - Version 1
 */

struct DisjointSet<Element: Hashable> {

    typealias Parent = Int
    typealias Root = Int
    
    struct Node {
        let value: Element
        var parent: Parent
    }
    
    var nodes = [Node]()
    var nodeIndices = [Element: Int]()
    
    init(_ elements: [Element]) {
        elements.forEach {
            let index = nodes.count
            nodeIndices[$0] = index
            nodes.append(Node(value: $0, parent: index))
        }
    }
    
    func find(_ element: Element) -> Root? {
        guard var index = nodeIndices[element] else {
            return nil
        }
        var node = nodes[index]
        while node.parent != index {
            index = node.parent
            node = nodes[index]
        }
        return index
    }
    
    mutating func union(_ element1: Element, _ element2: Element) -> Bool {
        guard let root1 = find(element1) else {
            fatalError("Element not found in set: \(element1)")
        }
        guard let root2 = find(element2) else {
            fatalError("Element not found in set: \(element2)")
        }
        guard root1 != root2 else {
            return false // elements already in same group
        }
        nodes[root1].parent = root2
        return true
    }

}

// MARK: - Test Cases
var set = DisjointSet(["A", "B", "C", "D"])
assert(set.union("A", "B") == true)
assert(set.union("C", "D") == true)
assert(set.union("A", "C") == true)
assert(set.union("C", "B") == false)
