//APOD - Astronomy Picture of the Day
import Foundation

struct Apod: Decodable{
    let date: String
    let explanation: String
    let hdurl: String?
    let mediaType: String
    let serviceVersion: String
    let title: String
    let url: String
}
