//
//  ForestViewController.swift
//  CloudCast
//
//  Created by Enyinnaya Chinatu on 05/03/2024.
//

// Import the UIKit framework
// You're almost always going to need this when your referencing UI elements in your file
import UIKit

// Class declaration, including the name of the class and its subclass (UIViewController)
class ForecastViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
   
    @IBOutlet weak var forecastImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var windImageView: UIImageView!
    
    @IBOutlet weak var windSpeed: UILabel!
    
    @IBOutlet weak var precipitationImageView: UIImageView!
    
    @IBOutlet weak var precipitation: UILabel!
    
    @IBAction func didTapBAckButton(_ sender: UIButton) {
        selectedForecastIndex = max(0, selectedForecastIndex - 1) // don't go lower than 0 index
            configure(with: forecasts[selectedForecastIndex])
    }
    
    @IBAction func didTapForwardButton(_ sender: UIButton) {
        selectedForecastIndex = min(forecasts.count - 1, selectedForecastIndex + 1)
            configure(with: forecasts[selectedForecastIndex])
    }
    
    
    private var forecasts = [WeatherForecast]() // tracks all the possible forecasts
    private var selectedForecastIndex = 0 // tracks which forecast is being shown, defaults to 0
    // Function override for the view controller
    // This is fired when the view has finished loading for the first time
    override func viewDidLoad() {
        // Some functions require you to call the super class implementation
        // Always read the online documentation to know if you need to
        super.viewDidLoad()
//        let fakeData = WeatherForecast(temperature: 25.0, date: Date(), weatherCode: .partlyCloudy, windSpeed: 33.0, precipitation: 30.0 )
//            configure(with: fakeData)
        forecasts = createMockData()
        configure(with: forecasts[selectedForecastIndex]) // configure the UI to show the first mock data
        
        addGradient()
    }
    
    private func createMockData() -> [WeatherForecast] {
        // This is just using the Calendar API to get a few random dates
        let today = Date()
        var dateComponents = DateComponents()
        dateComponents.day = 1
        let tomorrow = Calendar.current.date(byAdding: dateComponents, to: today)!
        let dayAfterTomorrow = Calendar.current.date(byAdding: dateComponents, to: tomorrow)!
        // Create a few mock data to show
        let mockData1 = WeatherForecast(temperature: 59.5,
                                        date:today,
                                        weatherCode: .violentRainShowers,
                                        windSpeed: 3.3,
                                        precipitation: 33.3)
        let mockData2 = WeatherForecast(temperature: 65.5,
                                        date:tomorrow,
                                        weatherCode: .fog,
                                        windSpeed: 3.7,
                                        precipitation: 13.3)
        let mockData3 = WeatherForecast(temperature: 49.5,
                                        date: dayAfterTomorrow,
                                        weatherCode: .partlyCloudy,
                                        windSpeed: 2.8,
                                        precipitation: 23.3)
        return [mockData1, mockData2, mockData3]
    }
    private func configure(with forecast: WeatherForecast) {
        forecastImageView.image = forecast.weatherCode.image
        descriptionLabel.text = forecast.weatherCode.description
        temperatureLabel.text = "\(forecast.temperature)°F"
        windSpeed.text = "\(forecast.windSpeed)"
        precipitation.text = "\(forecast.precipitation)"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        dateLabel.text = dateFormatter.string(from: forecast.date)
      }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 0.54, green: 0.88, blue: 0.99, alpha: 1.00).cgColor,
                                UIColor(red: 0.51, green: 0.81, blue: 0.97, alpha: 1.00).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
