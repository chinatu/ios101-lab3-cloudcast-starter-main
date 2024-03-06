//
//  WeatherForecast.swift
//  CloudCast
//
//  Created by Enyinnaya Chinatu on 05/03/2024.
//
import Foundation
import UIKit

struct WeatherForecast {
    let temperature: Double
    let date: Date
    let weatherCode: WeatherCode
    let windSpeed: Double
    let precipitation: Double
}

enum WeatherCode {
  case clearSky
  case mainlyClear
  case partlyCloudy
  case overcast
  case fog
  case lightDrizzle
  case moderateDrizzle
  case denseDrizzle
  case slightRainShowers
  case moderateRainShowers
  case violentRainShowers
  case windy

  var description: String {
    switch self {
    case .clearSky:
      return "Clear skies"
    case .mainlyClear:
      return "Mainly clear"
    case .partlyCloudy:
      return "Partly cloudy"
    case .overcast:
      return "Overcast"
    case .fog:
      return "Foggy"
    case .lightDrizzle:
      return "Light Drizzle"
    case .moderateDrizzle:
      return "Moderate Drizzle"
    case .denseDrizzle:
      return "Dense Drizzle"
    case .slightRainShowers:
      return "Slight Showers"
    case .moderateRainShowers:
      return "Moderate Showers"
    case .violentRainShowers:
      return "Violent Showers"
    case .windy:
        return "wind"
    }
  }

  var image: UIImage? {
    switch self {
    case .clearSky, .mainlyClear:
      return UIImage(named: "sun")
    case .partlyCloudy:
      return UIImage(named: "cloud-sun")
    case .overcast:
      return UIImage(named: "cloud")
    case .fog:
      return UIImage(named: "fog")
    case .lightDrizzle, .moderateDrizzle, .denseDrizzle:
      return UIImage(named: "drizzle")
    case .slightRainShowers, .moderateRainShowers, .violentRainShowers:
      return UIImage(named: "cloud-drizzle")
    case .windy:
        return UIImage(named: "wind")
    }
  }
}
