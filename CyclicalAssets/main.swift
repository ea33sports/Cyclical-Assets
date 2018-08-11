//
//  main.swift
//  CyclicalAssets
//
//  Created by Eric Andersen on 7/10/18.
//  Copyright © 2018 BigNerdRanch. All rights reserved.
//

import Foundation

var bob: Person? = Person(name: "Bob")
var rob: Person? = Person(name: "Rob")
print("created \(bob)")

var laptop: Asset? = Asset(name: "Shiny Laptop", value: 1_500.0)
var hat: Asset? = Asset(name: "Cowboy Hat", value: 175.0)
var backpack: Asset? = Asset(name: "Blue Backpack", value: 45.0)

bob?.useNetWorthChangedHandler { netWorth in
    print("Bob's net worth is now \(netWorth)")
}

bob?.takeOwnership(of: laptop!)
bob?.takeOwnership(of: hat!)
rob?.takeOwnership(of: laptop!)
bob?.removeOwnership(of: laptop!)

print("While Bob is alive, hat's owner is \(hat).owner)")
bob = nil
print("the bob variable is now \(bob)")
print("After Bob is deallocated, hat's owner is \(hat).owner")

laptop = nil
hat = nil
backpack = nil


