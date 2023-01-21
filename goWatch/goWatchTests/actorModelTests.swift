import Quick
import Nimble
@testable import goWatch

class actorModelTests: QuickSpec {
    override func spec() {
       
        var sut: ActorModel!
        
        beforeEach {
            sut = ActorModel()
            let actor = Actor(id: 4, name: "Vinicius", profileImage: "actor 04")
            sut?.addListActuator(actor: actor)
        }
        
        describe("#findAll") {
            context("validate Find All returns") {
                it("returns all Actors") {
                    expect(sut?.findAll().count) == 4
                }
                
                it("is not empty") {
                    expect(sut?.findAll()).toNot(beEmpty())
                }
            }
        }
        
        describe("#findById") {
            context("validate Find By Id returns") {
                it("find by id return correct actor") {
                    expect(sut?.findById(Index: 0).name).to(equal("Juliana"))
                }
            }
        }
        
        describe("#countElements") {
            context("validate count Elements returns") {
                it("return the correct value") {
                    expect(sut?.countElements) > 2
                }
            }
        }
        
        afterEach {
            sut = nil
        }
    }
}
