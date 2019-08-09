import Foundation
import Alamofire

class APIManager {
    func getWeather(completion: @escaping (CurrentWeather?) -> Void) {
        guard let url = URL(string: "https://community-open-weather-map.p.rapidapi.com/weather?q=London,uk") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("e5edc9ad63mshd7e088e01e83d2cp157718jsn14ddd8270658", forHTTPHeaderField: "x-rapidapi-key")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                print("error")
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    do {
                        let weather = try JSONDecoder().decode(CurrentWeather.self, from: data)
                        print(weather)
                        completion(weather)
                    } catch (let error) { // get error
                        print(error)
                        print("parse JSON failed------")
                    }
                }
            }
        }
        task.resume()
    }
    
    
    
    /*
    // Alamofire version......>
    
    func getRandomJokeAlamofire() {
        let headers: HTTPHeaders = [
            "x-rapidapi-key": "d7cd140d6emsh9d6e2be744bfd51p13f344jsn471a4d8ce9d5",
            "Accept": "application/json"
        ]
        Alamofire.request("https://matchilling-chuck-norris-jokes-v1.p.rapidapi.com/jokes/random", headers: headers).responseJSON { (data) in
            print(data)
        }
    }
 */
}
