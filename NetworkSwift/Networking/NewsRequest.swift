import Foundation

final class NewsViewModel: ObservableObject {
    @Published var newsResponse: NewsResponse?
    func GetNews() {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=science&apiKey=****APIKEY HERE****"
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            if let error = error {
                print(error)
            } else {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                if let data = data {
                    do {
                        let newsResponse = try decoder.decode(NewsResponse.self, from: data)
                        DispatchQueue.main.async{
                            self.newsResponse = newsResponse
                            print(newsResponse)
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }
        
        task.resume()
    }
}
