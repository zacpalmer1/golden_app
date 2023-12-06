import Alamofire
import SwiftUI

struct TimerView: View {
    
    @State private var secondsRemaining: Int = 0
    
    var formattedTime: String {
        let hours = secondsRemaining / 3600
        let minutes = (secondsRemaining % 3600) / 60
        return String(format: "%02d:%02d", hours, minutes)
    }
    
    var body: some View {
        VStack {
            Text(formattedTime)
                .font(.system(size: 24, weight: .heavy, design: .rounded))
                .foregroundColor(.gray)
        }
        .onAppear {
            self.fetchSunsetTime()
        }
    }
    
    func fetchSunsetTime() {
        AF.request("https://api.sunrise-sunset.org/json?lat=37.7749&lng=-122.4194&formatted=0").responseDecodable(of: SunsetResponse.self) { response in
            switch response.result {
            case .success(let sunsetResponse):
                if let sunsetTime = sunsetResponse.results?.sunset {
                    let currentTime = Date()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                    let sunsetDate = dateFormatter.date(from: sunsetTime)!
                    self.secondsRemaining = Int(sunsetDate.timeIntervalSince(currentTime))
                    
                    // Start the countdown timer
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                        if self.secondsRemaining > 0 {
                            self.secondsRemaining -= 1
                        } else {
                            timer.invalidate() // Stop the timer when countdown reaches 0
                        }
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    struct SunsetResponse: Codable {
        let results: SunsetResults?
    }

    struct SunsetResults: Codable {
        let sunset: String?
    }
}
