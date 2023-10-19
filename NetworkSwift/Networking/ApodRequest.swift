import Foundation

final class ApodViewModel: ObservableObject {
    @Published var apod: Apod?
    func GetApod() {
        let apodUrlSting = "https://api.nasa.gov/planetary/apod?api_key=****APIKEY HERE****"
        guard let url = URL(string: apodUrlSting) else {return}
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, response, error in
            if let error = error{
                print(error)
            } else {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                if let data = data {
                    do{
                        let apod = try decoder.decode(Apod.self, from: data)
                        DispatchQueue.main.async{
                            self?.apod = apod
                            print(apod)
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
