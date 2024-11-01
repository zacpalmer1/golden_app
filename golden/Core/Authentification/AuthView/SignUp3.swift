//
//  SignUp3.swift
//  golden
//
//  Created by Zachary Palmer on 8/11/24.
//

import SwiftUI

struct SignUp3: View {
    @State private var selectedDates: Set<Date> = [] // Set to hold selected dates
        @State private var isDatePickerVisible = false // State to control the visibility of the date picker
        @State private var datePickerSelection: Date = Date()
    var body: some View {
        VStack {
                    // TextField to display selected dates
                    TextField(
                        "Select Dates",
                        text: Binding(
                            get: { formattedDates() },
                            set: { _ in }
                        )
                    )
                    .onTapGesture {
                        isDatePickerVisible = true // Show the date picker when the text field is tapped
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                    // Show DatePicker if visible
                    if isDatePickerVisible {
                        VStack {
                            DatePicker(
                                "Select Date",
                                selection: $datePickerSelection,
                                displayedComponents: [.date]
                            )
                            .datePickerStyle(GraphicalDatePickerStyle())
                            .padding()
                            
                            Button(action: {
                                // Add the selected date to the list of selected dates
                                selectedDates.insert(datePickerSelection)
                                isDatePickerVisible = false // Hide the date picker
                            }) {
                                Text("Add Date")
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding()
                    }
                    
                    // Display selected dates
                    List {
                        ForEach(Array(selectedDates), id: \.self) { date in
                            Text(formattedDate(date))
                        }
                    }
                    .padding()
                }
            }

            // Format the selected dates as a comma-separated list
            private func formattedDates() -> String {
                let formatter = DateFormatter()
                formatter.dateStyle = .medium // Format dates as "Month Day, Year"
                return selectedDates.map { formatter.string(from: $0) }.joined(separator: ", ")
            }
            
            // Format a single date
            private func formattedDate(_ date: Date) -> String {
                let formatter = DateFormatter()
                formatter.dateStyle = .medium
                return formatter.string(from: date)
    }
}

#Preview {
    SignUp3()
}
