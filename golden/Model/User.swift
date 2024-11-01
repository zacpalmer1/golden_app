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
