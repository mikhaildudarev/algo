//  Created by Mikhail Dudarev on 04.07.2022.

import Algo
import XCTest

final class BinaryTreeTests: AlgoTests {
    
    func testInitFromArray() {
        let tree = try! BinaryTree(levelOrderedArray: [1, nil, 3, 4, 5])
        XCTAssertEqual(tree.root?.value, 1)
        XCTAssertNil(tree.root?.left)
        XCTAssertEqual(tree.root?.right?.value, 3)
        XCTAssertEqual(tree.root?.right?.left?.value, 4)
        XCTAssertEqual(tree.root?.right?.right?.value, 5)
    }
    
    func testSingleNode() {
        let node = BinaryTree.Node(value: 5)
        let tree = BinaryTree(root: node)
        XCTAssertEqual(tree.root?.value, 5)
    }
    
    func testPreOrderTraversal() {
        let root = BinaryTree.Node(value: 1)
        var node: BinaryTree.Node? = root
        node?.left = nil
        node?.right = BinaryTree.Node(value: 2)
        node = node?.right
        node?.left = BinaryTree.Node(value: 3)
        
        let tree = BinaryTree(root: root)
        tree.iteratorType = .preOrder
        XCTAssertEqual(tree.map { $0.value }, [1, 2, 3])
    }
    
    func testInOrderTraversal() {
        let root = BinaryTree.Node(value: 1)
        var node: BinaryTree.Node? = root
        node?.left = nil
        node?.right = BinaryTree.Node(value: 2)
        node = node?.right
        node?.left = BinaryTree.Node(value: 3)
        
        let tree = BinaryTree(root: root)
        tree.iteratorType = .inOrder
        XCTAssertEqual(tree.map { $0.value }, [1, 3, 2])
    }
    
    func testPostOrderTraversal() {
        let root = BinaryTree.Node(value: 1)
        var node: BinaryTree.Node? = root
        node?.left = nil
        node?.right = BinaryTree.Node(value: 2)
        node = node?.right
        node?.left = BinaryTree.Node(value: 3)
        
        let tree = BinaryTree(root: root)
        tree.iteratorType = .postOrder
        XCTAssertEqual(tree.map { $0.value }, [3, 2, 1])
    }
    
    func testLevelOrderTraversal1() {
        let root = BinaryTree.Node(value: 3)
        var node: BinaryTree.Node? = root
        node?.left = BinaryTree.Node(value: 9)
        node?.right = BinaryTree.Node(value: 20)
        node = node?.right
        node?.left = BinaryTree.Node(value: 15)
        node?.right = BinaryTree.Node(value: 7)
        
        let tree = BinaryTree(root: root)
        tree.iteratorType = .levelOrder
        XCTAssertEqual(tree.map { $0.value }, [3, 9, 20, 15, 7])
    }
    
    func testLevelOrderTraversal2() {
        let root = BinaryTree.Node(value: 4)
        
        var node: BinaryTree.Node? = root
        node?.left = BinaryTree.Node(value: 7)
        node?.right = BinaryTree.Node(value: 2)
        
        node = root.left
        node?.left = BinaryTree.Node(value: 9)
        node?.right = BinaryTree.Node(value: 6)
        
        node = root.right
        node?.left = BinaryTree.Node(value: 3)
        node?.right = BinaryTree.Node(value: 1)
        
        let tree = BinaryTree(root: root)
        tree.iteratorType = .levelOrder
        XCTAssertEqual(tree.map { $0.value }, [4, 7, 2, 9, 6, 3, 1])
    }
    
}
