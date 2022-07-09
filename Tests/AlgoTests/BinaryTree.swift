//  Created by Mikhail Dudarev on 04.07.2022.

import Algo
import XCTest

final class BinaryTreeTests: AlgoTests {
    
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
    
    func testLevelOrderTraversal() {
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
    
}
