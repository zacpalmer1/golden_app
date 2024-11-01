//
//  AuthService.swift
//  golden
//
//  Created by Zachary Palmer on 9/21/24.
//


import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthService: ObservableObject {
    
    static let shared = AuthService()
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func createUser(email: String,password: String,firstName: String,lastName: String,age: Int,gender: String, phone:String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(firstName: firstName, lastName: lastName, email: email, age: age, gender: gender, phone: phone, id: result.user.uid)
        } catch {
            print("failed to create user \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func login(email: String,password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("failed to create user \(error.localizedDescription)")
        }
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.reset()
    }
    
    @MainActor
    private func uploadUserData(firstName: String,lastName: String,email: String,age: Int,gender: String, phone: String, id: String) async throws {
        let user = User(id: id, firstName: firstName, lastName: lastName, email: email, age: age, gender: gender, phone: phone,friendsIds: [], friendsRequestsIds: [])
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
        
    }
    
}
