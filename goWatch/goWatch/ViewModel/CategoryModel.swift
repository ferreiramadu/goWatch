import UIKit

class CategoryModel {
    private var listCategory: [Category] = []
    
    init() {
        getCategories()
    }
    
    private func getCategories() {
        self.listCategory.append(Category(id: 0, title: "Animação"))
        self.listCategory.append(Category(id: 1, title: "Comédia"))
        self.listCategory.append(Category(id: 2, title: "Ação"))
        self.listCategory.append(Category(id: 3, title: "Romance"))
        self.listCategory.append(Category(id: 4, title: "Terror"))
    }
    
    public func findAll() -> [Category] {
        return listCategory
    }
    
    public func findById(Index: Int) -> Category {
        return self.listCategory[Index]
    }
    
    public var countElements: Int {
        return self.listCategory.count
    }
}
