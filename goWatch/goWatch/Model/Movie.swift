import Foundation
import UIKit

struct Movie {
    var id: Int
    var title: String
    var synopsis: String
    var year: Int
    var banner: UIImage
    var background: UIImage
    var category: Category
    var cast: [Actor]
    var numberOfLikes: Int
    var splash: UIImage
}
