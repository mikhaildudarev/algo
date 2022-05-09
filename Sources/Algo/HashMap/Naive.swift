//  Created by Mikhail Dudarev on 09.05.2022.

public extension HashMap {
    
    final class Naive<Key: Hashable, Value>: HashMapProtocol {
        
        // MARK: - Type Aliases
        private typealias BucketElement = (key: Key, value: Value)
        
        // MARK: - Properties
        private var buckets: [[BucketElement]]
        private var capacity: Int
        
        // MARK: - Init/Deinit
        public init() {
            let defaultCapacity = 1000
            buckets = Array(repeating: [], count: defaultCapacity)
            capacity = defaultCapacity
        }
        
        public init(capacity: Int) {
            buckets = Array(repeating: [], count: capacity)
            self.capacity = capacity
        }
        
        // MARK: - Private Methods
        private func bucketIndex(for key: Key) -> Int {
            key.hashValue & capacity
        }
        
        // MARK: - Public Methods
        public func set(_ value: Value, forKey key: Key) {
            let newElement = BucketElement(key: key, value: value)
            let bucketIndex = bucketIndex(for: key)
            let elementIndex = buckets[bucketIndex].firstIndex { $0.key == key}
            guard let elementIndex = elementIndex else {
                buckets[bucketIndex].append(newElement)
                return
            }
            buckets[bucketIndex][elementIndex] = newElement
        }
        
        public func get(forKey key: Key) -> Value? {
            let bucketIndex = bucketIndex(for: key)
            let element = buckets[bucketIndex].first { $0.key == key }
            return element?.value
        }
        
        public func remove(forKey key: Key) {
            let bucketIndex = bucketIndex(for: key)
            let elementIndex = buckets[bucketIndex].firstIndex { $0.key == key }
            guard let elementIndex = elementIndex else {
                return
            }
            buckets[bucketIndex].remove(at: elementIndex)
        }
        
    }
    
}
