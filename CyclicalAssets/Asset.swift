//
//  Asset.swift
//  CyclicalAssets
//
//  Created by Eric Andersen on 7/10/18.
//  Copyright © 2018 BigNerdRanch. All rights reserved.
//

import Foundation

class Asset: CustomStringConvertible {
    let name: String
    let value: Double
    weak var owner: Person?
    var assetIndex: Int
    
    var description: String {
        if let actualOwner = owner {
            return "Asset(\(name), worth \(value), owned by \(actualOwner)"
        } else {
            return "Asset(\(name), worth \(value), not owned by anyone)"
        }
    }
    
    init(name: String, value: Double) {
        self.name = name
        self.value = value
        self.assetIndex = 0
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
}
