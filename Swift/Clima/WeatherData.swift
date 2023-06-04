import Foundation

struct WeatherData: Codable {
    let name: String
    let id: Int
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
    let icon: String
    let main: String
}
