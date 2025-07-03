//
//  User.swift
//  golden
//
//  Created by Zachary Palmer on 9/21/24.
//

import Foundation
import Firebase
import FirebaseAuth

struct User: Identifiable,Hashable,Codable {
    
    let id: String
    var firstName: String
    var lastName: String
    var email: String
    var profileImageName: String?
    var coverImageName: String?
    var age: Int
    let gender: String
    var phone: String
    var friendsIds: [String]
    var friendsRequestsIds: [String]
    var isCurrentUser: Bool {
            guard let currentUid = Auth.auth().currentUser?.uid else { return false }
            return id == currentUid
        }
 
}

// Mock Data
let trendingUser = [
    (image: "joshlarge", name: "Josh Powers", username: "@joshpowers", rank: "1st:"),
    (image: "kennlarge", name: "Kennedy Seigler", username: "@kennseigler", rank: "2nd:"),
    (image: "lindalarge", name: "Lindsay McNamara", username: "@lindamc",  rank: "3rd:"),
    (image: "blakelarge", name: "Blake Gillian", username: "@blakegill",  rank: "4th:"),
    (image: "zaclarge", name: "Zac Palmer", username: "@zacpalmer1", rank: "5th:")
]
let suggestedUser = [
    (image: "blakelarge", name: "Blake Gillian", username: "@blakegill"),
    (image: "kennlarge", name: "Kennedy Seigler", username: "@kennseigler"),
    (image: "zaclarge", name: "Zac Palmer", username: "@zacpalmer1"),
    (image: "joshlarge", name: "Josh Powers", username: "@joshpowers"),
    (image: "lindalarge", name: "Lindsay McNamara", username: "@lindamc")
]
let userFeedData: [UserFeedItem] = [
    // Josh
    UserFeedItem(
        image: "joshlarge",
        name: "Josh Powers",
        username:"joshpowers",
        followersCount: "675",
        streaks: "5",
        likes: "2",
        comments: "2",
        date: "Today",
        favoritePosts: ["joshlarge1", "joshlarge2", "joshlarge3", "joshlarge4", "joshlarge5", "joshlarge6"]),
    // Kennedy
    UserFeedItem(
        image: "kennlarge",
        name: "Kennedy Seigler",
        username:"kennseigler2",
        followersCount: "1.2K",
        streaks: "3",
        likes: "4",
        comments: "2",
        date: "Today",
        favoritePosts: ["joshlarge1", "joshlarge2", "joshlarge3", "joshlarge4", "joshlarge5", "joshlarge6"]),
    // Lindsay
    UserFeedItem(
        image: "lindalarge",
        name: "Lindsay McNamara",
        username:"lindsaymac17",
        followersCount: "988",
        streaks: "0",
        likes: "6",
        comments: "2",
        date: "Today",
        favoritePosts: ["joshlarge1", "joshlarge2", "joshlarge3", "joshlarge4", "joshlarge5", "joshlarge6"]),
    // Zachary
    UserFeedItem(
        image: "zac2large",
        name: "Zachary Palmer",
        username:"zacpalmer1",
        followersCount: "175",
        streaks: "3",
        likes: "7",
        comments: "1",
        date: "Today",
        favoritePosts: ["joshlarge1", "joshlarge2", "joshlarge3", "joshlarge4", "joshlarge5", "joshlarge6"]),
    // Blake
    UserFeedItem(
        image: "blakelarge",
        name: "Blake Gillian",
        username:"blakegill",
        followersCount: "2",
        streaks: "8",
        likes: "7",
        comments: "2",
        date: "Today",
        favoritePosts: ["joshlarge1", "joshlarge2", "joshlarge3", "joshlarge4", "joshlarge5", "joshlarge6"]),
    // Zac
    UserFeedItem(
        image: "zaclarge",
        name: "Zac Palmer",
        username:"zaacattack",
        followersCount: "823",
        streaks: "9",
        likes: "8",
        comments: "2",
        date: "Today",
        favoritePosts: ["joshlarge1", "joshlarge2", "joshlarge3", "joshlarge4", "joshlarge5", "joshlarge6"]),
    // Wedge
    UserFeedItem(
        image: "wedgelarge",
        name: "Jack Wedge",
        username:"mrwedge",
        followersCount: "9",
        streaks: "5",
        likes: "2",
        comments: "2",
        date: "Yesterday",
        favoritePosts: ["joshlarge1", "joshlarge2", "joshlarge3", "joshlarge4", "joshlarge5", "joshlarge6"]),
    // Will
    UserFeedItem(
        image: "willlarge",
        name: "Will Smith",
        username:"williamsmith4",
        followersCount: "12k",
        streaks: "3",
        likes: "4",
        comments: "2",
        date: "Yesterday",
        favoritePosts: ["joshlarge1", "joshlarge2", "joshlarge3", "joshlarge4", "joshlarge5", "joshlarge6"]),
    // Davis
    UserFeedItem(
        image: "davislarge",
        name: "Davis Cooney",
        username:"daviscooney",
        followersCount: "233",
        streaks: "0",
        likes: "6",
        comments: "2",
        date: "Yesterday",
        favoritePosts: ["joshlarge1", "joshlarge2", "joshlarge3", "joshlarge4", "joshlarge5", "joshlarge6"]),
    // Mac
    UserFeedItem(
        image: "maclarge",
        name: "Will Mcann",
        username:"macmacan",
        followersCount: "9k",
        streaks: "3",
        likes: "7",
        comments: "1",
        date: "Yesterday",
        favoritePosts: ["joshlarge1", "joshlarge2", "joshlarge3", "joshlarge4", "joshlarge5", "joshlarge6"]),
    // Moose
    UserFeedItem(
        image: "mooselarge",
        name: "Ryan Moosebruger",
        username:"mooserisburger",
        followersCount: "1.8k",
        streaks: "8",
        likes: "7",
        comments: "2",
        date: "Yesterday",
        favoritePosts: ["joshlarge1", "joshlarge2", "joshlarge3", "joshlarge4", "joshlarge5", "joshlarge6"]),
    // Hammer
    UserFeedItem(
        image: "hammerlarge",
        name: "Hammer Blair",
        username:"hammerb32",
        followersCount: "1.3k",
        streaks: "9",
        likes: "8",
        comments: "2",
        date: "Yesterday",
        favoritePosts: ["joshlarge1", "joshlarge2", "joshlarge3", "joshlarge4", "joshlarge5", "joshlarge6"])
]
struct UserFeedItem: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let username: String
    let followersCount: String
    let streaks: String
    let likes: String
    let comments: String
    let date: String
    let favoritePosts: [String]
   
}
