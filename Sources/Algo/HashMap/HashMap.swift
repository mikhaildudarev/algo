//  Created by Mikhail Dudarev on 09.05.2022.

/**
 https://en.wikipedia.org/wiki/Hash_table
 */

public protocol HashMapProtocol {
    
    associatedtype Key
    associatedtype Value
    
    init()
    
    init(capacity: Int)
    
    func set(_ value: Value, forKey key: Key)
    
    func get(forKey key: Key) -> Value?
    
    func remove(forKey key: Key)
    
}

public enum HashMap {}
