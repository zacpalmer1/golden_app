import SwiftUI

struct Settings: View {
    @State private var usersearch: String = ""
    @StateObject private var colorSelection = ColorSelection()
    @Environment(\.presentationMode) var presentationMode
    @State private var settingsPrivacy = false
    @State private var settingsBlocked = false
    @State private var settingsNotifications = false
    @State private var showMeshGradient = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) { // Aligns content to the top
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text("Settings")
                            .font(.system(size: 30, weight: .heavy, design: .default))
                        Spacer()
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            ZStack {
                                Circle()
                                    .frame(width: 35)
                                    .foregroundStyle(.clear)
                                Image(systemName: "x.circle")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                        }
                    }

                    Text("Your Account")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .padding(.bottom, 5)
                    
                    // Settings options
                    Button(action: {
                        settingsPrivacy.toggle()
                    }) {
                        settingsOptionRow(icon: "lock.fill", title: "Account Privacy", detail: "Public")
                    }
                    .fullScreenCover(isPresented: $settingsPrivacy) {
                        SettingsPrivacy()
                    }
                    
                    Divider()
                    
                    Button(action: {
                        settingsBlocked.toggle()
                    }) {
                        settingsOptionRow(icon: "person.slash.fill", title: "Blocked Accounts", detail: "3")
                    }
                    .fullScreenCover(isPresented: $settingsBlocked) {
                        SettingsBlocked()
                    }
                    
                    Divider()
                    
                    Button(action: {
                        settingsNotifications.toggle()
                    }) {
                        settingsOptionRow(icon: "bell.fill", title: "Notifications", detail: "")
                    }
                    .fullScreenCover(isPresented: $settingsNotifications) {
                        SettingsNotifications()
                    }
                    
                    Divider()
                    
                    settingsOptionRow(icon: "lifepreserver", title: "Help", detail: "")
                    Divider()
                    settingsOptionRow(icon: "info.circle.fill", title: "About", detail: "")
                    Divider()
                    settingsOptionRow(icon: "person.fill", title: "Log Out", detail: "")
                    Divider()
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 25)
                .padding(.top, 0) // Remove any additional top padding
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top) // Align ZStack to the top
            .padding(.top, 0) // Remove any additional padding added by NavigationStack if necessary
        }
    }

    // Helper function for each settings option row
    private func settingsOptionRow(icon: String, title: String, detail: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(colorScheme == .dark ? .white : .black)
            Text(title)
                .foregroundColor(colorScheme == .dark ? .white : .black)
            Spacer()
            if !detail.isEmpty {
                Text(detail)
                    .foregroundColor(.gray)
            }
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    Settings()
}
