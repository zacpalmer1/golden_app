//
//  LoginModel.swift
//  golden
//
//  Created by Zachary Palmer on 9/21/24.
//

import Foundation


class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
    
}
