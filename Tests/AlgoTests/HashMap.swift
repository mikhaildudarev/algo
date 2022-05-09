//  Created by Mikhail Dudarev on 09.05.2022.

import Algo
import XCTest

final class HashMapTests: AlgoTests {
    
    func test() {
        let hashMap = HashMap.Naive<String, Int>()
        hashMap.set(1, forKey: "a")
        hashMap.set(2, forKey: "b")
        hashMap.set(3, forKey: "c")
        hashMap.set(4, forKey: "d")
        XCTAssertEqual(hashMap.get(forKey: "a"), 1)
        XCTAssertEqual(hashMap.get(forKey: "b"), 2)
        XCTAssertEqual(hashMap.get(forKey: "c"), 3)
        XCTAssertEqual(hashMap.get(forKey: "d"), 4)
        hashMap.set(77, forKey: "a")
        XCTAssertEqual(hashMap.get(forKey: "a"), 77)
        hashMap.remove(forKey: "c")
        XCTAssertNil(hashMap.get(forKey: "c"))
    }
    
}
