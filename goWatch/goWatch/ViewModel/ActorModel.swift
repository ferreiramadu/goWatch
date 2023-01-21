import UIKit

class ActorModel {
    private var listActor: [Actor] = []
    
    init() {
        getCategories()
    }
    
    private func getCategories() {
        self.listActor.append(Actor(id: 0, name: "Juliana", profileImage: "ator 01"))
        self.listActor.append(Actor(id: 1, name: "Eduardo", profileImage: "ator 02"))
        self.listActor.append(Actor(id: 2, name: "Kylie", profileImage: "ator 03"))
    }
    
    public func findAll() -> [Actor] {
        return listActor
    }
    
    public func findById(Index: Int) -> Actor {
        return self.listActor[Index]
    }
    
    public var countElements: Int {
        return self.listActor.count
    }
    
    public func addListActuator(actor:Actor) -> Void {
        self.listActor.append(actor)
    }
}
