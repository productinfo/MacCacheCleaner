//
//  MainCacheList.swift
//  MacCacheCleaner
//
//  Created by Kaunteya Suryawanshi on 26/06/18.
//  Copyright © 2018 Kaunteya Suryawanshi. All rights reserved.
//

import Foundation

typealias JSON = [String : Any]

/// Maintains the list of all possible caches that can be present in Mac
class MainCache {

    /// Fetches all possible caches in json format.
    /// Converts them to CacheItem list
    /// Stores them in list variable
    class func updateFromNetwork(completion: (_ list: Set<CacheItem>) -> Void) {
        let url = Bundle.main.url(forResource: "Source", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! JSON
        let items = json["items"] as! [JSON]
        let cacheItemList = items.map { CacheItem($0) }
        completion(Set(cacheItemList))
    }
}
