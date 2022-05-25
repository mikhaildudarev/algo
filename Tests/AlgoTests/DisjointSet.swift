//  Created by Mikhail Dudarev on 25.05.2022.

import Algo
import XCTest

final class DisjointSetTests: AlgoTests {
    
    func testSequence() {
        let set = DisjointSet.QuickFind([1, 2, 3])
        XCTAssertEqual(set.reduce(Int.zero, +), 6) 
    }
    
}
