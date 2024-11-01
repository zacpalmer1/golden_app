//
//  RegistrationModel.swift
//  golden
//
//  Created by Zachary Palmer on 9/21/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var age: String = ""
    @Published var gender: String = ""
    @Published var phone: String = ""
    
    @MainActor
    func createUser() async throws {
        if let age = Int(age) {
            try await AuthService.shared.createUser(email: email, password: password, firstName: firstName, lastName: lastName, age: age, gender: gender, phone: phone)
        } else {
            try await AuthService.shared.createUser(email: email, password: password, firstName: firstName, lastName: lastName, age: 0, gender: gender, phone: phone)
        }
    }
    
    
}
