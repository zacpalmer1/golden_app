//
//  SearchGradient.swift
//  golden
//
//  Created by Zachary Palmer on 9/26/24.
//

import SwiftUI
import Combine
class ColorSelection: ObservableObject {
    @Published var selectedColors: [Color] = [] // Initialize as an empty array

    init() {
        loadColors() // Load colors after initialization
        if selectedColors.isEmpty {
            // If no colors were loaded, set to default
            selectedColors = [Color(hex: "#FF3C38"), Color(hex: "#8F0200"), Color(hex: "#FF8C42")]
        }
    }

    private func saveColors() {
        let colorsData = selectedColors.compactMap { $0.toData() }
        UserDefaults.standard.set(colorsData, forKey: "selectedColors")
    }

    private func loadColors() {
        guard let colorsData = UserDefaults.standard.array(forKey: "selectedColors") as? [Data] else { return }
        selectedColors = colorsData.compactMap { Color(data: $0) }
    }

    // Method to update colors
    func updateColors(newColors: [Color]) {
        self.selectedColors = newColors
        saveColors()
    }
}
extension Color {
    private var rgba: (red: Double, green: Double, blue: Double, alpha: Double) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red: Double(red), green: Double(green), blue: Double(blue), alpha: Double(alpha))
    }

    // Convert Color to Data
    func toData() -> Data? {
        let components = self.rgba
        let dict: [String: Double] = ["red": components.red, "green": components.green, "blue": components.blue, "alpha": components.alpha]
        return try? JSONSerialization.data(withJSONObject: dict, options: [])
    }

    // Initialize Color from Data
    init?(data: Data) {
        guard let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Double],
              let red = dict["red"],
              let green = dict["green"],
              let blue = dict["blue"],
              let alpha = dict["alpha"] else { return nil }
        self = Color(red: red, green: green, blue: blue, opacity: alpha)
    }
}
struct MessagesGradient: View {
    @State private var isAnimating = false
    @ObservedObject var colorSelection: ColorSelection
    var show: Bool // Add a parameter to control visibility
    
    var body: some View {
        ZStack {
            if #available(iOS 18.0, *) {
                MeshGradient(
                    width: 3,
                    height: 3,
                    points: [[0.0, 0.0], [isAnimating ? 0.1 : 0.9, 0.0], [1.0, 0.0],
                             [0.0, 0.5], [0.5, isAnimating ? 1.0 : 0.5], [1.0, 0.5],
                             [0.0, 1.0], [0.5, 1.0], [1.0, 1.0]],
                    colors: colorSelection.selectedColors
                )
                .opacity(show ? 1 : 0) // Control opacity based on the parameter
                .onAppear {
                    withAnimation(.easeInOut(duration: 8).repeatForever(autoreverses: true)) {
                        isAnimating.toggle()
                    }
                }
            } else {
                // Fallback on earlier versions
            }
        }
        .ignoresSafeArea()
    }
}

