//
//  Group.swift
//  golden
//
//  Created by Zachary Palmer on 11/13/24.
//

import Foundation

struct GroupData: Identifiable{
    let id = UUID()
    let name: String
    let image: String
}

let GroupFeedData: [GroupData] = [
    GroupData(name: "Charlotte", image: "charlotte"),
    GroupData(name: "Charleston", image: "charleston"),
    GroupData(name: "Greenville", image: "greenville"),
    GroupData(name: "Atlanta", image: "atlanta"),
    GroupData(name: "Washington D.C", image: "dc"),
    GroupData(name: "New York City", image: "newyorkcity"),
    GroupData(name: "Philadelphia", image: "philadelphia")
]
