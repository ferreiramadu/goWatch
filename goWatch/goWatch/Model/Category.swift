import Foundation

struct Category : Equatable {
    var id: Int
    var title: String
}

//extension Category : Equatable {
//    static func == (lhs: Category, rhs: Category) -> Bool {
//        lhs.id == rhs.id
//    }
//}
